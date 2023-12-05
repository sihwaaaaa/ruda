package co.poetrypainting.ruda.scheduler;

import co.poetrypainting.ruda.domain.alarm.Alarm;
import co.poetrypainting.ruda.service.kakao.KakaoService;
import co.poetrypainting.ruda.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class AlarmScheduler {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final MemberService memberService;
    private final KakaoService kakaoService;

    /**
     * 1분마다 도는 scheduler memeber에게 alarm을 보낸다.
     */
    @Scheduled(fixedDelay = 60000)
    public void something(){
        logger.info("[+| alarm scheduler start");
        List<Alarm> alarms = memberService.GetAlarmList();
        Calendar now = calculateTime(new Date());
        List<Integer> memberList = new ArrayList<>();
        for(Alarm alarm: alarms){
            Calendar alarmTime = calculateTime(alarm.getAlarmTime());
            if (now == alarmTime){
                memberList.add(alarm.getMemberNo());
            }
            memberList.add(alarm.getMemberNo());
        }

        if (memberList.isEmpty()){
            return;
        }

        for(Integer memberNo: memberList){
            kakaoService.SendAlarm(memberService.GetKakaoToken(memberNo));
        }

        logger.info("  | alarm scheduler finish");
    }

    private Calendar calculateTime(Date time){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(time);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar;
    }
}
