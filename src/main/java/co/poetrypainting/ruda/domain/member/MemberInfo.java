package co.poetrypainting.ruda.domain.member;

import lombok.Data;

import java.util.Date;

@Data
public class MemberInfo {
    private Long memberNo;
    private String name;
    private String email;
    private String password;
    private Role role;
    private String nickname;
    private String profileImage;
    private String thumbnailImage;
    private Date createdDate;
    private Date updatedDate;
}
