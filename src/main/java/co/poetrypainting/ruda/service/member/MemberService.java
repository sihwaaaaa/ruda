package co.poetrypainting.ruda.service.member;

import co.poetrypainting.ruda.config.security.JwtProvider;
import co.poetrypainting.ruda.dao.kakao.KakaoMapper;
import co.poetrypainting.ruda.dao.member.MemberMapper;
import co.poetrypainting.ruda.domain.alarm.Alarm;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import co.poetrypainting.ruda.domain.kakao.KakaoUserInfo;
import co.poetrypainting.ruda.domain.member.Login;
import co.poetrypainting.ruda.domain.member.MemberInfo;
import co.poetrypainting.ruda.domain.member.Role;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Base64;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberMapper memberMapper;
    private final KakaoMapper kakaoMapper;
    private final Gson gson = new Gson();
    private final String BASE_URI = "http://localhost:8080/api/v1/user/kakao";


//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        MemberInfo memberInfo = memberMapper.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("member is not exist..."));
//        return User.builder().username(memberInfo.getEmail()).password(memberInfo.getPassword()).roles(memberInfo.getRole().name()).build();
//    }

    public String KakaoLogin(String authorize_code) {
        try {
            HttpClient client = HttpClient.newHttpClient();

            // get token
            UriComponentsBuilder getTokenUri = UriComponentsBuilder.fromHttpUrl(BASE_URI + "/get/token")
                    .queryParam("authorize_code", authorize_code);

            HttpRequest getTokenReq = HttpRequest.newBuilder()
                    .uri(URI.create(getTokenUri.toUriString()))
                    .GET().build();

            HttpResponse<String> getTokenResp = client.send(getTokenReq, HttpResponse.BodyHandlers.ofString());
            KakaoToken kakaoToken = gson.fromJson(getTokenResp.body(), KakaoToken.class);

            // get userinfo
            UriComponentsBuilder getUserInfoUri = UriComponentsBuilder.fromHttpUrl(BASE_URI + "/get/userinfo")
                    .queryParam("access_token", kakaoToken.getAccessToken());

            HttpRequest getUserInfoReq = HttpRequest.newBuilder()
                    .uri(URI.create(getUserInfoUri.toUriString()))
                    .GET().build();

            HttpResponse<String> getUserInfoResp = client.send(getUserInfoReq, HttpResponse.BodyHandlers.ofString());
            KakaoUserInfo kakaoUserInfo = gson.fromJson(getUserInfoResp.body(), KakaoUserInfo.class);

            // email을 통해 로그인 한 user의 가입여부 확인
            MemberInfo memberInfo = GetMemberInfo(kakaoUserInfo.getEmail());
            memberInfo = memberInfo == null ? SignUp(kakaoUserInfo) : memberInfo;
            kakaoToken.setMemberNo(memberInfo.getMemberNo());

            // regist token
            RegistToken(kakaoToken);
            String jwt = JwtProvider.CreateToken(memberInfo.getEmail());

            return jwt;
        } catch (Exception exception) {
            logger.error(exception.toString());
            return null;
        }
    }

    public boolean Login(String token) {
        Long memberNo = memberMapper.getMemberNo(JwtProvider.GetEmail(token));
        try {
            Login login = new Login();
            login.setMemberNo(memberNo);
            login.setAccessToken(token);
            if(memberMapper.getLogin(memberNo) == null){
                memberMapper.insertLogin(login);
            }else{
                memberMapper.updateLogin(login);
            }
        } catch (Exception exception) {
            logger.error(exception.getMessage());
            return false;
        }
        return true;
    }

    public boolean isLogin(String token) {
        return memberMapper.getLogin(memberMapper.getMemberNo(JwtProvider.GetEmail(token))) != null;
    }

    public MemberInfo GetMemberInfo(String email) {
        return memberMapper.getMemberInfo(email);
    }

    public Long GetMemberNo(String email){
        return memberMapper.getMemberNo(email);
    }

    public MemberInfo SignUp(KakaoUserInfo kakaoUserInfo) {
        // member 생성
        try {
            kakaoUserInfo.setRole(Role.USER);
            memberMapper.insertMember(kakaoUserInfo);
            memberMapper.insertDefaultAlarm(memberMapper.getMemberNo(kakaoUserInfo.getEmail()));
        } catch (Exception exception) {
            logger.error(exception.toString());
            return null;
        }

        // 생성한 member 가져오기
        return GetMemberInfo(kakaoUserInfo.getEmail());
    }

    public void RegistToken(KakaoToken kakaoToken) {
        // check Token from memberNo
        String accessToken = kakaoMapper.getAccessToken(kakaoToken.getMemberNo());
        try {
            if (accessToken == null) {
                kakaoMapper.insertUserToken(kakaoToken);
            } else {
                kakaoMapper.updateUserToken(kakaoToken);
            }
        } catch (Exception exception) {
            logger.error(exception.getCause().toString());
        }
    }

    public boolean RefreshToken(String email) {
        // get refreshToken
        String refreshToken = kakaoMapper.getRefreshToken(email);
        try {
            HttpClient client = HttpClient.newHttpClient();

            UriComponentsBuilder getRefreshToken = UriComponentsBuilder.fromHttpUrl(BASE_URI + "/get/refresh-token")
                    .queryParam("refresh_token", refreshToken);
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(getRefreshToken.toUriString()))
                    .GET().build();

            HttpResponse<String> getUserInfoResp = client.send(request, HttpResponse.BodyHandlers.ofString());
            KakaoToken kakaoToken = gson.fromJson(getUserInfoResp.body(), KakaoToken.class);

            RegistToken(kakaoToken);
            return true;
        } catch (Exception exception) {
            logger.error(exception.getMessage());
            return false;
        }
    }

    public List<Alarm> GetAlarmList() {
        return memberMapper.getAlarmList();
    }

    public String GetKakaoToken(Long memberNo) {
        return kakaoMapper.getAccessToken(memberNo);
    }
}
