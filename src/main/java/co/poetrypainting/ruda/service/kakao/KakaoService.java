package co.poetrypainting.ruda.service.kakao;

import co.poetrypainting.ruda.domain.kakao.KakaoError;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Slf4j
@Service
public class KakaoService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${spring.security.oauth2.client.provider.kakao.token-uri}")
    private String TOKEN_URI;

    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String CLIENT_ID;

    /**
     * Kakao 인가코드받기를 통해 받은 인가코드를 이용
     * 토큰을 받아오는 서비스
     *
     * @param authorize_code kakao login callback 으로 받은 authorize code
     */
    public void  GetToken(String authorize_code) throws IOException, InterruptedException {
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("grant_type", "authorization_code");
        jsonObject.addProperty("client_id", CLIENT_ID);
        jsonObject.addProperty("redirect_uri", "http://localhost:8080");
        jsonObject.addProperty("code", authorize_code);
        jsonObject.addProperty("client_secret","client_secret");

        Gson gson = new Gson();
        String jsonStr = gson.toJson(jsonObject);

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(TOKEN_URI))
                    .headers("Content-Type", "application/x-www-form-urlencoded")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonStr))
                    .build();

            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());
            if (response.statusCode() == 200) {
                KakaoToken token = gson.fromJson(response.body(), KakaoToken.class);
                logger.debug("[+| body : {}", response.body());
                logger.debug("[+| json : {}", token.toString()) ;
            }else{
                KakaoError error = gson.fromJson(response.body(), KakaoError.class);
                logger.error("[+| body : {}", response.body());
                logger.error("[+| json : {}", error.toString()); ;
            }
        } catch (Exception exception) {
            logger.error(exception.toString());
        }
    }
}
