package co.poetrypainting.ruda.controller;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MainController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Value("${spring.security.oauth2.client.provider.kakao.authorization-uri}")
    private String AUTHORIZATION_URI;

    @Value("${spring.security.oauth2.client.registration.kakao.client-id}")
    private String CLIENT_ID;

    @Value("${spring.security.oauth2.client.registration.kakao.redirect-uri}")
    private String REDIRECT_URI;


    @GetMapping("/")
    public String home(Model model){
        return "index";
    }

    @GetMapping("/signin")
    public String login(Model model){
        model.addAttribute("AUTHORIZATION_URI",AUTHORIZATION_URI);
        model.addAttribute("CLIENT_ID",CLIENT_ID);
        model.addAttribute("REDIRECT_URI",REDIRECT_URI);
        return "login";
    }
}
