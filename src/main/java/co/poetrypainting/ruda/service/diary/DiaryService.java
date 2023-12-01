package co.poetrypainting.ruda.service.diary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.poetrypainting.ruda.domain.ColorDto;
import co.poetrypainting.ruda.domain.DiaryVo;
import co.poetrypainting.ruda.dao.diary.DiaryMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class DiaryService {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final DiaryMapper diaryMapper;

    public void register(DiaryVo vo) {
        logger.info("regist diary: {}",vo);
        diaryMapper.insert(vo);
    }

    public List<ColorDto> getColor() {
        return diaryMapper.selectColorDto();
    }

    public String getDiaryList() {
        List<DiaryVo> diaryVos = diaryMapper.selectDiaryList();
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(diaryVos);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "[]"; // 또는 다른 오류 처리 방식
        }
    }

    public DiaryVo get(Long diaryNo) {
        return diaryMapper.selectByPrimaryKey(diaryNo);
    }

    public String getColorCode(Long getColorNo) {
        return diaryMapper.getColorCode(getColorNo);
    }


    public List<DiaryVo> searchDiaryList(String keyword, int offset, int limit, String sortOrder) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("keyword", keyword);
        parameters.put("offset", offset);
        parameters.put("limit", limit);

        // 정렬 순서에 따라 다른 메서드 호출
        if ("latest".equals(sortOrder)) {
            return diaryMapper.searchDiaryListLatest(parameters);
        } else if ("oldest".equals(sortOrder)) {
            return diaryMapper.searchDiaryListOldest(parameters);
        } else {
            // 기본적으로 최신순으로 가져오도록 설정
            return diaryMapper.searchDiaryListLatest(parameters);
        }
    }

    public int countSearchDiary(String keyword) {
        return diaryMapper.countSearchDiary(keyword);
    }
}
