package co.poetrypainting.ruda.controller;

import co.poetrypainting.ruda.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MainController {
    @Value("${spring.security.oauth2.client.provider.kakao.authorization-uri}")
    private String AUTHORIZATION_URI;

    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String CLIENT_ID;

    @Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
    private String REDIRECT_URI;

    private final MemberService memberService;

    @GetMapping("/")
    public String home() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String login(Model model) {
        model.addAttribute("AUTHORIZATION_URI", AUTHORIZATION_URI);
        model.addAttribute("CLIENT_ID", CLIENT_ID);
        model.addAttribute("REDIRECT_URI", REDIRECT_URI);
        return "login";
    }
}
