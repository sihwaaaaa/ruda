package co.poetrypainting.ruda.dao.member;

import co.poetrypainting.ruda.domain.alarm.Alarm;
import co.poetrypainting.ruda.domain.kakao.KakaoToken;
import co.poetrypainting.ruda.domain.kakao.KakaoUserInfo;
import co.poetrypainting.ruda.domain.member.MemberInfo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface MemberMapper {
    Optional<MemberInfo> findByEmail(String email);

    MemberInfo getMemberInfo(String email);

    List<Alarm> getAlarmList();

    String getAccessToken(int memberNo);

    void insertMember(KakaoUserInfo kakaoUserInfo) throws Exception;

    void insertUserToken(KakaoToken kakaoToken) throws Exception;

    void updateUserToken(KakaoToken kakaoToken) throws Exception;

    void insertDefaultAlarm(int memberNo) throws Exception;


}
