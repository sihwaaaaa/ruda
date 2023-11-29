package co.poetrypainting.ruda.controller.diary;

import co.poetrypainting.ruda.service.diary.DiaryService;

import java.sql.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/diary")
public class DiaryController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private DiaryService diaryService;

    @GetMapping("/write/{ownerDate}")
    public String Write(Model model, @PathVariable Long ownerDate) {
        Date date = new Date(ownerDate);
        model.addAttribute("color", diaryService.getColor());
        model.addAttribute("ownerDate", date);
        model.addAttribute("ownerDateType",ownerDate);
        return "diary/write";
    }
    
    @PostMapping("/write/{ownerDate}")
    public String write(DiaryVo vo) {
        diaryService.register(vo);
        return "redirect:/";

    }


    @GetMapping("/{diaryNo}")
    public String Read(Model model, @PathVariable Long diaryNo) {
        model.addAttribute("diary", diaryService.get(diaryNo));
        logger.info("{}", diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
        model.addAttribute("color", diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
        return "diary/read";
    }

    // @GetMapping("{bno}")
    // public String getByPath(Model model, @PathVariable Long bno, HttpSession session){
    // 	MemberVO member = (MemberVO) session.getAttribute("loginMember");
    // 	model.addAttribute("board", boardService.get(bno));
    // 	model.addAttribute("pg", tradeService.getProgress(bno));
    // 	model.addAttribute("cheatNameList", cheatService.cheatNameList());
    // 	if (member != null) {
    // 		model.addAttribute("trade", tradeService.getMyList(bno, member.getMemberNo()));
    // 		model.addAttribute("member", member.getMemberNo());
    // 	}else {
    // 		model.addAttribute("member", null);
    // 	}

    // 	return "/board/get";
    // }
}
