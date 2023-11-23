package co.poetrypainting.ruda.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.poetrypainting.ruda.controller.DiaryController;
import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;
import co.poetrypainting.ruda.mapper.DiaryMapper;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class DiaryServiceImpl implements DiaryService{

     Logger logger = LoggerFactory.getLogger(DiaryServiceImpl.class);
  @Autowired
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
