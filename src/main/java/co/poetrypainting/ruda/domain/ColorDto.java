package co.poetrypainting.ruda.domain;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
public class ColorDto {
    private int colorNo;
    private String colorCode;
}
