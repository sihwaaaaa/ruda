package co.poetrypainting.ruda.controller.api.v1.user.member;

import co.poetrypainting.ruda.service.member.MemberService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.Base64;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/member")
public class MemberController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberService memberService;

    @GetMapping("/login")
    public String login(@RequestParam("code") String authorize_code) throws IOException {
        String jwt = memberService.KakaoLogin(authorize_code);
        String token = Base64.getEncoder().encodeToString(jwt.getBytes());
        return memberService.Login(token) ? String.format("redirect:/diary?token=%s", token) : "redirect:/";
    }

    @GetMapping("/regist/token")
    public void RegistUserToken(@RequestParam("email") String email) {
        logger.info("[+| API CALL Refresh Token - /api/v1/user/kakao/regist/token");
        if (memberService.RefreshToken(email)) {
            logger.info("  | Refresh Token Success");
        } else {
            logger.error("  | Refresh Token Failure");
        }
    }
}
