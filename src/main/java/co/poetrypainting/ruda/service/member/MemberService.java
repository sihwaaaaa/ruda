package co.poetrypainting.ruda.service.member;

import co.poetrypainting.ruda.config.security.JwtProvider;
import co.poetrypainting.ruda.dao.member.MemberMapper;
import co.poetrypainting.ruda.domain.alarm.Alarm;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import co.poetrypainting.ruda.domain.kakao.KakaoUserInfo;
import co.poetrypainting.ruda.domain.member.MemberInfo;
import co.poetrypainting.ruda.domain.member.Role;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberService implements UserDetailsService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberMapper memberMapper;
    private final Gson gson = new Gson();
    private final String BASE_URI = "http://localhost:8080/api/v1/user/kakao";


    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        MemberInfo memberInfo = memberMapper.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException("member is not exist..."));
        return User.builder().username(memberInfo.getEmail()).password(memberInfo.getPassword()).roles(memberInfo.getRole().name()).build();
    }

    public String Login(String authorize_code) {
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
            return JwtProvider.CreateToken(memberInfo.getEmail());
        } catch (Exception exception) {
            logger.error(exception.toString());
            return null;
        }
    }

    public MemberInfo GetMemberInfo(String email) {
        return memberMapper.getMemberInfo(email);
    }

    public MemberInfo SignUp(KakaoUserInfo kakaoUserInfo) {
        // member 생성
        try {
            kakaoUserInfo.setRole(Role.USER);
            memberMapper.insertMember(kakaoUserInfo);
            MemberInfo memberInfo = memberMapper.getMemberInfo(kakaoUserInfo.getEmail());
            memberMapper.insertDefaultAlarm(memberInfo.getMemberNo());
        } catch (Exception exception) {
            logger.error(exception.toString());
            return null;
        }

        // 생성한 member 가져오기
        return GetMemberInfo(kakaoUserInfo.getEmail());
    }

    public void RegistToken(KakaoToken kakaoToken) {
        // check Token from memberNo
        String accessToken = memberMapper.getAccessToken(kakaoToken.getMemberNo());
        try {
            if (accessToken == null) {
                memberMapper.insertUserToken(kakaoToken);
            } else {
                memberMapper.updateUserToken(kakaoToken);
            }
        } catch (Exception exception) {
            logger.error(exception.getCause().toString());
        }
    }

    public boolean RefreshToken(String email) {
        // get refreshToken
        String refreshToken = memberMapper.getRefreshToken(email);
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

    public String GetKakaoToken(int memberNo) {
        return memberMapper.getAccessToken(memberNo);
    }
}
