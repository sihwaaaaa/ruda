package co.poetrypainting.ruda.mapper;

import org.apache.ibatis.annotations.Mapper;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

@Mapper
public interface DiaryMapper {
    Long insert(DiaryVo vo);
    ColorDto selectColorDto();
}
