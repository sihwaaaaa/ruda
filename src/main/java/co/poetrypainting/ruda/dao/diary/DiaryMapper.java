package co.poetrypainting.ruda.dao.diary;

import java.util.List;
import java.util.Map;

import co.poetrypainting.ruda.domain.color.ColorDto;
import co.poetrypainting.ruda.domain.diary.DiaryVo;
import org.springframework.stereotype.Repository;

@Repository
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
