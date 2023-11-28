package co.poetrypainting.ruda.service.diary;

import java.util.List;

import co.poetrypainting.ruda.domain.color.ColorDto;
import co.poetrypainting.ruda.domain.diary.DiaryVo;

public interface DiaryService {
    void register(DiaryVo vo);
    List<ColorDto> getColor();
    DiaryVo get(Long diaryNo);
    String getColorCode(Long getColorNo);
} 
