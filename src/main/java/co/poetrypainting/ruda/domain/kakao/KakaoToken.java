package co.poetrypainting.ruda.domain.kakao;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

import java.util.Date;

@Data
public class KakaoToken {
    // kakao token response body
    @SerializedName("access_token")
    private String accessToken;
    @SerializedName("token_type")
    private String tokenType;
    @SerializedName("refresh_token")
    private String refreshToken;
    @SerializedName("expires_in")
    private int expiresIn;
    private String scope;
    @SerializedName("refresh_token_expires_in")
    private int refreshTokenExpiresIn;

    // ruda database items
    private int memberNo;
    private Date createdDate;
    private Date updatedDate;
}
