package co.poetrypainting.ruda.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;
import co.poetrypainting.ruda.service.DiaryService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
@Controller
@Slf4j
public class DiaryController {
  Logger logger = LoggerFactory.getLogger(DiaryController.class);
  @Autowired
  private DiaryService diaryService;
  @GetMapping("/write")
  public String Write(Model model) {
      model.addAttribute("color",diaryService.getColor());
      return "write";
   }

	@PostMapping("/write")
	public String write(DiaryVo vo){
    diaryService.register(vo);
    return "redirect:/";
    
  }
	


  @GetMapping("/{diaryNo}")
  public String Read(Model model, @PathVariable Long diaryNo) {
    model.addAttribute("diary",diaryService.get(diaryNo));
    logger.info("{}",diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
    model.addAttribute("color",diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
    return "read";
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
