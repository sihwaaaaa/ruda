package co.poetrypainting.ruda.controller.api.v1.user;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping(value = "/api/v1/user")
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * kakao login의 인증에서 받아온 정보를 바탕으로
     * ID를 만든는 API
     */
    @GetMapping("/signup")
    public String signup(){
        logger.info("signup");
        return "redirect:/";
    }
}
