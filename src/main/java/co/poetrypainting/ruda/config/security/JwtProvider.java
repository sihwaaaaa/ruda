package co.poetrypainting.ruda.config.security;

import io.jsonwebtoken.Jwts;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Date;

@Slf4j
@Component
@RequiredArgsConstructor
public class JwtProvider {

    /**
     * JWT Token 생성
     *
     * @param email <-- 생성 user eamil
     * @return JWT token
     */
    public static String CreateToken(String email) {
        long expiredMs = 1000L * 60 * 120; //ms 60 * 1000L는 1분. 60 * 1000L * 120 는 2시간
        Date now = new Date();
        return Jwts.builder()
                .subject(email)
                .signWith(SecurityConfig.key)
                .issuedAt(new Date(now.getTime()))
                .expiration(new Date(now.getTime() + expiredMs))
                .compact();
    }

    public static boolean CheckToken(String token, String email) {
        return Jwts.parser().verifyWith(SecurityConfig.key).build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject()
                .equals(email);
    }

    /**
     * JWT Token 만료 시간 확인
     * Token 만료 날짜가 지금보다 이전인지 확인
     *
     * @param token token
     * @return 만료 여부 확인 결과
     */
    public static boolean IsExpired(String token) {
        return Jwts.parser().verifyWith(SecurityConfig.key).build()
                .parseSignedClaims(token)
                .getPayload()
                .getExpiration().before(new Date());
    }

    public static String GetEmail(String token) {
        return Jwts.parser().verifyWith(SecurityConfig.key).build()
                .parseSignedClaims(token)
                .getPayload()
                .getSubject();
    }
}
