package co.poetrypainting.ruda.domain.diary;

import java.util.Date;

import lombok.Data;

@Data
public class DiaryVo {
    private Long diaryNo;
    private String weather;
    private String emotion;
    private String keyword;
    private String content;
    private Long colorNo;
    private Date regDate;
    private Long memberNo;
    private Date ownerDate;
}
