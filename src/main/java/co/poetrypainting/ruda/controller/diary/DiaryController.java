package co.poetrypainting.ruda.controller.diary;

import co.poetrypainting.ruda.config.security.JwtProvider;
import co.poetrypainting.ruda.service.diary.DiaryService;

import java.sql.Date;
import java.util.List;

import co.poetrypainting.ruda.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import co.poetrypainting.ruda.domain.diary.DiaryVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequestMapping("/diary/{token}")
@RequiredArgsConstructor
public class DiaryController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final DiaryService diaryService;
    private final MemberService memberService;

    @GetMapping("")
    public String home(Model model, @PathVariable String token) {
        model.addAttribute("diaryList", diaryService.getDiaryList(token));
        model.addAttribute("token", token);
        return "index";
    }

    @GetMapping("/write/{ownerDate}")
    public String Write(Model model, @PathVariable String token, @PathVariable Long ownerDate) {
        Date date = new Date(ownerDate);
        model.addAttribute("color", diaryService.getColor());
        model.addAttribute("ownerDate", date);
        model.addAttribute("ownerDateType", ownerDate);
        model.addAttribute("token", token);
        return "diary/write";
    }

    @PostMapping("/write/{ownerDate}")
    public String write(@PathVariable String token, DiaryVo vo) {
        String email = JwtProvider.GetEmail(token);
        vo.setMemberNo(memberService.GetMemberNo(email));
        diaryService.register(vo);
        return String.format("redirect:/diary/%s", token);
    }


    @GetMapping("/{diaryNo}")
    public String Read(Model model, @PathVariable String token, @PathVariable Long diaryNo) {
        model.addAttribute("diary", diaryService.get(diaryNo));
        logger.info("{}", diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
        model.addAttribute("color", diaryService.getColorCode(diaryService.get(diaryNo).getColorNo()));
        model.addAttribute("token", token);
        return "diary/read";
    }

    @GetMapping("/search")
    public String search(
            @RequestParam(name = "q", required = false) String query,
            @RequestParam(name = "sortOrder", defaultValue = "latest") String sortOrder,
            @RequestParam(name = "page", defaultValue = "1") int page,
            Model model,
            @PathVariable String token
    ) {
        int pageSize = 5; // 한 페이지에 보여질 아이템 수
        int offset = (page - 1) * pageSize; // offset 계산

        if (query != null) {
            // query가 null이 아닌 경우에 처리
            model.addAttribute("keyword", query);

            Long memberNo = memberService.GetMemberNo(JwtProvider.GetEmail(token));
            List<DiaryVo> diaryList = diaryService.searchDiaryList(memberNo, query, offset, pageSize, sortOrder);
            model.addAttribute("diaryList", diaryList);

            // 페이징 처리
            int totalCount = diaryService.countSearchDiary(query);
            int totalPages = (int) Math.ceil((double) totalCount / pageSize);
            model.addAttribute("currentPage", page);
            model.addAttribute("totalPages", totalPages);
            model.addAttribute("token", token);
        }
        return "diary/search";
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
