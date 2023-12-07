package co.poetrypainting.ruda.controller.diary;

import co.poetrypainting.ruda.service.member.MemberService;
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
@RequestMapping("/diary")
@RequiredArgsConstructor
public class RouteDiaryController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final MemberService memberService;

    @GetMapping("")
    public String route(@RequestParam("token") String token) {
        logger.debug("token: {}",token);
        return memberService.isLogin(token) ? String.format("redirect:/diary/%s", token) : "redirect:/";
    }
}
