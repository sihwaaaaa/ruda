package co.poetrypainting.ruda.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
