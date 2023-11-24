package co.poetrypainting.ruda.controller.api.v1.user.oauth2;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/oauth2")
public class OAuth2Controller {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    /**
     * Kakao Login Service Redirect uri
     *
     * @param code Kakao Authorization code
     */
    @GetMapping("/kakao/callback")
    public void callback(@RequestParam String code){
        logger.info("[+] kakao login service call");
        logger.info("    authorization code :: {}", code);
    }
}
