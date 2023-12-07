package co.poetrypainting.ruda.dao.member;

import co.poetrypainting.ruda.domain.alarm.Alarm;
import co.poetrypainting.ruda.domain.kakao.KakaoUserInfo;
import co.poetrypainting.ruda.domain.member.Login;
import co.poetrypainting.ruda.domain.member.MemberInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberMapper {
    MemberInfo getMemberInfo(String email);

    Long getMemberNo(String email);

    List<Alarm> getAlarmList();

    void insertMember(KakaoUserInfo kakaoUserInfo) throws Exception;

    void insertDefaultAlarm(Long memberNo) throws Exception;

    Login getLogin(Long memberNo);

    void insertLogin(Login login) throws Exception;

    void updateLogin(Login login) throws Exception;

    void deleteLogin(Long memberNo) throws Exception;
}
