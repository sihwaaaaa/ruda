package co.poetrypainting.ruda.controller.api.v1.user.member;

import co.poetrypainting.ruda.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/member")
public class MemberController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberService memberService;

    /**
     * ruda Login
     *
     * @param authorize_code Kakao Authorization code
     */
    @GetMapping("/login")
    public void login(@RequestParam("code") String authorize_code) {
        memberService.Login(authorize_code);

//        // kakao api get token
//        KakaoToken kakaoToken = kakaoService.GetKakaoToken(code);
//        if (kakaoToken == null) {
//            return "redirect:/error";
//        }
//
//        // kakao api get user info
//        KakaoUserInfo kakaoUserInfo = kakaoService.GetUserAllInfo(kakaoToken.getAccessToken());
//        if (kakaoUserInfo == null) {
//            return "redirect:/error";
//        }
//
//        return "redirect:/";
    }

    @PostMapping("/regist/token")
    public void RegistUserToken() {
        logger.info("[+| API CALL Regist Token - /api/v1/user/kakao/regist/token");
    }
}
