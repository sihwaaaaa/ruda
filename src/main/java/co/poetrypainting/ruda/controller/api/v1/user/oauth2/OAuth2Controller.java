package co.poetrypainting.ruda.controller.api.v1.user.oauth2;

import co.poetrypainting.ruda.domain.kakao.KakaoError;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import co.poetrypainting.ruda.service.kakao.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.net.http.HttpResponse;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/oauth2")
public class OAuth2Controller {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final KakaoService kakaoService;

    /**
     * Kakao Login Service Redirect URI
     *
     * @param code Kakao Authorization code
     */
    @GetMapping("/kakao/callback")
    public String callBack(@RequestParam String code) throws IOException, InterruptedException {
        logger.debug("[+| kakao login service call");
        logger.debug("    authorization code :: {}", code);
        logger.debug("[+| start get access token");
        kakaoService.GetToken(code);
        logger.info("callback");
        return "redirect:/api/v1/user/signup";
    }
}
