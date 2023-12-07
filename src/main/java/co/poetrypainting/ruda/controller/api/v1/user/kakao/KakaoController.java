package co.poetrypainting.ruda.controller.api.v1.user.kakao;

import co.poetrypainting.ruda.service.kakao.KakaoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/kakao")
public class KakaoController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final KakaoService kakaoService;

    /**
     * kakao Token 가져오는 API
     *
     * @param authorize_code kakao authorize code
     * @return KakaoToken
     */
    @GetMapping("/get/token")
    public ResponseEntity<String> GetToken(@RequestParam("authorize_code") String authorize_code) {
        logger.info("[+| API CALL Get Token - /api/v1/user/kakao/get/token");
        String kakaoToken = kakaoService.GetKakaoToken(authorize_code);
        return new ResponseEntity<>(kakaoToken, null, kakaoToken != null ? HttpStatus.OK : HttpStatus.UNAUTHORIZED);
    }

    /**
     * kakao user info를 가져오는 API
     *
     * @param access_token kakao user access token
     * @return KakaoUserInfo
     */
    @GetMapping("/get/userinfo")
    public ResponseEntity<String> GetUserInfo(@RequestParam("access_token") String access_token) {
        logger.info("[+| API CALL Get UserInfo - /api/v1/user/kakao/get/userinfo");
        String kakaoUserInfo = kakaoService.GetUserAllInfo(access_token);
        return new ResponseEntity<>(kakaoUserInfo, null, kakaoUserInfo != null ? HttpStatus.OK : HttpStatus.UNAUTHORIZED);
    }
}
