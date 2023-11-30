package co.poetrypainting.ruda.domain.kakao;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

@Data
public class KakaoUserInfo {
    private int memberNo;
    private String nickname;
    @SerializedName("profile_image") private String profileImage;
    @SerializedName("thumbnail_image") private String thumbnailImage;
    private String name;
    private String email;
}
