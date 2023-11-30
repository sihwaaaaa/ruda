package co.poetrypainting.ruda.domain.member;

import lombok.Data;

import java.util.Date;

@Data
public class MemberInfo {
    private int memberNo;
    private String name;
    private String email;
    private String nickname;
    private String profileImage;
    private String thumbnailImage;
    private Date createdDate;
    private Date updatedDate;
}
