package co.poetrypainting.ruda.controller.diary;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.poetrypainting.ruda.service.diary.DiaryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/diary")
public class DiaryController {
    private final Logger logger = LoggerFactory.getLogger(DiaryController.class);
    @Autowired
    private DiaryService diaryService;
     @GetMapping("/write")
  public String Write(Model model) {
    model.addAttribute("color",diaryService.getColor());
  	logger.info("write");
    return "write";
  }
  @GetMapping("/read")
  public String Read() {
  	logger.info("read");
    return "read";
  }
}
