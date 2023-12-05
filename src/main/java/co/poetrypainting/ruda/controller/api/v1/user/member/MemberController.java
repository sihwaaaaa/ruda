package co.poetrypainting.ruda.controller.api.v1.user.member;

import co.poetrypainting.ruda.config.security.JwtProvider;
import co.poetrypainting.ruda.domain.member.MemberInfo;
import co.poetrypainting.ruda.service.member.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;
import java.net.URI;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/api/v1/user/member")
public class MemberController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberService memberService;

    @GetMapping("/login")
    public String login(@RequestParam("code") String authorize_code, HttpServletRequest request, HttpSession session) throws IOException {
        String jwt = memberService.Login(authorize_code);
        return "redirect:/diary/";
    }

    @PostMapping("/regist/token")
    public void RegistUserToken() {
        logger.info("[+| API CALL Regist Token - /api/v1/user/kakao/regist/token");
    }
}
