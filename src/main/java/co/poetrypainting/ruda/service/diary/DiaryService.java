package co.poetrypainting.ruda.service.diary;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

public interface DiaryService {
    void register(DiaryVo vo);
    ColorDto getColor();
    
} 
