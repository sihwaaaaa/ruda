package co.poetrypainting.ruda.dao.kakao;

import org.springframework.stereotype.Repository;

@Repository
public interface KakaoMapper {
    String getAccessToken(int memberNo);
}
