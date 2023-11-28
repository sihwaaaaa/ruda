package co.poetrypainting.ruda.domain.kakao;

import lombok.Data;

@Data
public class KakaoToken {
    private String tokenType;
    private String accessToken;
    private int expiresIn;
    private String refreshToken;
    private int refreshTokenExpiresIn;
}
