package co.poetrypainting.ruda.domain.kakao;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

@Data
public class KakaoProfile {

    private String nickName;
    @SerializedName("thumbnail_image") private String thumbnailImage;
    @SerializedName("profile_image") private String profileImage;

}
