package co.poetrypainting.ruda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

@Mapper
public interface DiaryMapper {
    Long insert(DiaryVo vo);
    List<ColorDto> selectColorDto();
    DiaryVo selectByPrimaryKey(Long diaryNo);
    String getColorCode(Long getColorNo);
}
