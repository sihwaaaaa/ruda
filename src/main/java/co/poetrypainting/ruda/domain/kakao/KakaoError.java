package co.poetrypainting.ruda.domain.kakao;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

@Data
public class KakaoError {
    private String error;
    @SerializedName("error_description")
    private String description;
    @SerializedName("error_code")
    private String code;
}
