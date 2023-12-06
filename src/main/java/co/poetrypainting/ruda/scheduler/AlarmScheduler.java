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

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
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
     *
     * @fixedDelay 60000ms 1분 마다 실행
     */
    @Scheduled(fixedDelay = 60000)
    public void something() {
        logger.info("[+| alarm scheduler start");
        List<Integer> memberList = new ArrayList<>();
        List<Alarm> alarms = memberService.GetAlarmList();

        LocalTime now = dateToLocalTime(new Date());
        for (Alarm alarm : alarms) {
            LocalTime alarmTime = dateToLocalTime(alarm.getAlarmTime());
            if (now.equals(alarmTime)) {
                memberList.add(alarm.getMemberNo());
            }
        }

        if (memberList.isEmpty()) {
            return;
        }

        for (Integer memberNo : memberList) {
            kakaoService.SendAlarm(memberService.GetKakaoToken(memberNo));
        }
        logger.info("  | alarm scheduler finish");
    }

    private LocalTime dateToLocalTime(Date date) {
        Instant instant = date.toInstant();
        LocalDateTime localDateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault());
        LocalTime tmp = localDateTime.toLocalTime();
        return LocalTime.of(tmp.getHour(), tmp.getMinute());
    }
}
