package co.poetrypainting.ruda.domain.member;

import lombok.Data;

import java.util.Date;

@Data
public class Login {
    private Long memberNo;
    private String accessToken;
    private Date createdDate;
}
