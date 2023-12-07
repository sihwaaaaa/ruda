package co.poetrypainting.ruda.dao.kakao;

import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import org.springframework.stereotype.Repository;

@Repository
public interface KakaoMapper {
    String getAccessToken(Long memberNo);

    String getRefreshToken(String email);

    void insertUserToken(KakaoToken kakaoToken) throws Exception;

    void updateUserToken(KakaoToken kakaoToken) throws Exception;
}
