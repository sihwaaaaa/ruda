package co.poetrypainting.ruda.service;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

public interface DiaryService {
    void register(DiaryVo vo);
    ColorDto getColor();
    
} 
