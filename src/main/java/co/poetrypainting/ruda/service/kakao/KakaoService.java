package co.poetrypainting.ruda.service.kakao;

import co.poetrypainting.ruda.domain.kakao.KakaoUserInfo;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponentsBuilder;

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
    @Value("${spring.security.oauth2.client.provider.kakao.user-info-uri}")
    private String USER_INFO_URI;

    @Value("${spring.security.oauth2.client.provider.kakao.talk-memo}")
    private String TALK_MEMO;

    @Value("${spring.security.oauth2.client.provider.kakao.template-id}")
    private String TEMPLATE_ID;
    private final Gson gson = new Gson();

    /**
     * Kakao 인가코드받기를 통해 받은 인가코드를 이용
     * 토큰을 받아오는 서비스
     *
     * @param authorizeCode kakao login callback 으로 받은 authorize code
     */
    public String GetKakaoToken(String authorizeCode) {
        KakaoToken kakaoToken = new KakaoToken();

        try {
            // uri 생성
            UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromHttpUrl(TOKEN_URI)
                    .queryParam("grant_type", "authorization_code")
                    .queryParam("client_id", CLIENT_ID)
                    .queryParam("redirect_uri", REDIRECT_URI)
                    .queryParam("code", authorizeCode)
                    .queryParam("client_secret", CLIENT_SECRET);

            // client 및 request 생성
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(uriComponentsBuilder.toUriString()))
                    .headers("Content-Type", "application/x-www-form-urlencoded")
                    .POST(HttpRequest.BodyPublishers.noBody())
                    .build();

            // kakao api call
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() != 200) {
                logger.error(response.body());
                return response.body();
            }

            // json parsing
            kakaoToken = gson.fromJson(response.body(), KakaoToken.class);
        } catch (Exception exception) {
            logger.error(exception.toString());
        }

        return gson.toJson(kakaoToken);
    }


    /**
     * get kakao user all info service
     *
     * @param accessToken kakao accessToken
     */
    public String GetUserAllInfo(String accessToken) {
        Gson gson = new Gson();
        KakaoUserInfo userInfo = new KakaoUserInfo();

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(USER_INFO_URI))
                    .headers("Authorization", "Bearer " + accessToken)
                    .GET()
                    .build();

            // kakao api call
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() != 200) {
                logger.error(response.body());
                return response.body();
            }


            // parsing response body
            JsonElement jsonElement = JsonParser.parseString(response.body());
            KakaoUserInfo properties = gson.fromJson(jsonElement.getAsJsonObject().get("properties").getAsJsonObject(), KakaoUserInfo.class);
            JsonObject kakaoAccount = jsonElement.getAsJsonObject().get("kakao_account").getAsJsonObject();
            properties.setEmail(kakaoAccount.get("email").getAsString());
            userInfo = properties;
        } catch (Exception exception) {
            logger.error(exception.toString());
        }

        return gson.toJson(userInfo);
    }

    public void RegistUserToken() {

    }

    public void SendAlarm(String accessToken){
        try {
            // uri 생성
            UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromHttpUrl(TALK_MEMO)
                    .queryParam("template_id", TEMPLATE_ID);

            // client 및 request 생성
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(uriComponentsBuilder.toUriString()))
                    .headers(
                            "Content-Type", "application/x-www-form-urlencoded",
                            "Authorization", String.format("Bearer %s",accessToken)
                    )
                    .POST(HttpRequest.BodyPublishers.noBody())
                    .build();

            // kakao api call
            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() != 200) {
                logger.error(response.body());
            }
        } catch (Exception exception) {
            logger.error(exception.toString());
        }
    }
}
