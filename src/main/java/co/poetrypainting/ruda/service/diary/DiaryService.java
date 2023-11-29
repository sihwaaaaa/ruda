package co.poetrypainting.ruda.service.diary;

import java.util.List;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

public interface DiaryService {
    void register(DiaryVo vo);
    List<ColorDto> getColor();
    DiaryVo get(Long diaryNo);
    String getColorCode(Long getColorNo);
    String getDiaryList();
} 
