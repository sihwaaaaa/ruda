package co.poetrypainting.ruda.dao.diary;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;

@Mapper
public interface DiaryMapper {
    Long insert(DiaryVo vo);
    List<ColorDto> selectColorDto();
    DiaryVo selectByPrimaryKey(Long diaryNo);
    String getColorCode(Long getColorNo);
    List<DiaryVo> selectDiaryList();
    List<DiaryVo> searchDiaryListLatest(Map<String, Object> parameters);

    List<DiaryVo> searchDiaryListOldest(Map<String, Object> parameters);

    int countSearchDiary(String keyword);
}
