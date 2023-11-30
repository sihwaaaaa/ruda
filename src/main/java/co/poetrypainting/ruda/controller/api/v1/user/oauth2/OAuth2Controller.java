package co.poetrypainting.ruda.controller.api.v1.user.oauth2;

import co.poetrypainting.ruda.service.kakao.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/oauth2")
public class OAuth2Controller {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
}
