package co.poetrypainting.ruda.service.diary;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.poetrypainting.ruda.domain.color.ColorDto;
import co.poetrypainting.ruda.domain.diary.DiaryVo;
import co.poetrypainting.ruda.dao.diary.DiaryMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DiaryServiceImpl implements DiaryService {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private DiaryMapper diaryMapper;

    @Override
    public void register(DiaryVo vo) {
        diaryMapper.insert(vo);
    }

    @Override
    public List<ColorDto> getColor() {
        List<ColorDto> colors = diaryMapper.selectColorDto();
        return colors;
    }

    @Override
    public DiaryVo get(Long diaryNo) {
        DiaryVo vo = diaryMapper.selectByPrimaryKey(diaryNo);
        return vo;
    }

    @Override
    public String getColorCode(Long getColorNo) {
        String code = diaryMapper.getColorCode(getColorNo);
        return code;
    }

}
