package co.poetrypainting.ruda.service.kakao;

import co.poetrypainting.ruda.dao.kakao.KakaoMapper;
import co.poetrypainting.ruda.domain.kakao.KakaoError;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
@Service
@RequiredArgsConstructor
public class KakaoService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${spring.security.oauth2.client.provider.kakao.token-uri}")
    private String TOKEN_URI;

    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String CLIENT_ID;

    @Value("${spring.security.oauth2.client.registration.kakao.client-secret}")
    private String CLIENT_SECRET;

    @Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
    private String REDIRECT_URI;

    private KakaoMapper kakaoMapper;

    /**
     * Kakao 인가코드받기를 통해 받은 인가코드를 이용
     * 토큰을 받아오는 서비스
     *
     * @param authorize_code kakao login callback 으로 받은 authorize code
     */
    public void  GetToken(String authorize_code) throws IOException, InterruptedException {
        Gson gson = new Gson();

//        JsonObject jsonObject = new JsonObject();
//        jsonObject.addProperty("grant_type", "authorization_code");
//        jsonObject.addProperty("client_id", CLIENT_ID);
//        jsonObject.addProperty("redirect_uri", REDIRECT_URI);
//        jsonObject.addProperty("code", authorize_code);
//        jsonObject.addProperty("client_secret",CLIENT_SECRET);
//        String jsonStr = gson.toJson(jsonObject);

        try {
            HttpClient client = HttpClient.newHttpClient();
            UriComponentsBuilder uri = UriComponentsBuilder.fromHttpUrl(TOKEN_URI)
                    .queryParam("grant_type", "authorization_code")
                    .queryParam("client_id", CLIENT_ID)
                    .queryParam("redirect_uri", REDIRECT_URI)
                    .queryParam("code", authorize_code)
                    .queryParam("client_secret",CLIENT_SECRET);

//            HttpRequest request = HttpRequest.newBuilder()
//                    .uri(URI.create(TOKEN_URI+""))
//                    .headers("Content-Type", "application/x-www-form-urlencoded")
//                    .POST(HttpRequest.BodyPublishers.noBody())
//                    .build();

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(uri.toUriString()))
                    .headers("Content-Type", "application/x-www-form-urlencoded")
                    .POST(HttpRequest.BodyPublishers.noBody())
                    .build();



            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                KakaoToken token = gson.fromJson(response.body(), KakaoToken.class);
                logger.info("[+| body : {}", response.body());
                logger.info("[+| json : {}", token.toString()); ;
            }else{
                KakaoError error = gson.fromJson(response.body(), KakaoError.class);
                logger.error("[+| body : {}", response.body());
                logger.error("[+| json : {}", error.toString()); ;
            }
        } catch (Exception exception) {
            logger.error(exception.toString());
        }
    }

    public String GetAccessToken(int memberNo){
        return kakaoMapper.getAccessToken(memberNo);
    }
}
