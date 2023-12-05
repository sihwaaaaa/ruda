package co.poetrypainting.ruda.domain.alarm;

import lombok.Data;

import java.util.Date;

@Data
public class Alarm {
    private int memberNo;
    private Date alarmTime;
}
