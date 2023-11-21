package co.poetrypainting.ruda.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import co.poetrypainting.ruda.service.KakaoLoginServiceImpl;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class TestController {

	Logger logger = LoggerFactory.getLogger(TestController.class);
  @GetMapping("/")
  public String hello() {
  	logger.info("hello");
    return "index";
  }
 
 @Autowired
    public KakaoLoginServiceImpl iKakaoS;
   
	// 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
	// 2번 받은 code를 iKakaoS.getAccessToken로 보냄 ###access_Token###로 찍어서 잘 나오면은 다음단계진행
	// 3번 받은 access_Token를 iKakaoS.getUserInfo로 보냄 userInfo받아옴, userInfo에 nickname, email정보가 담겨있음
	@GetMapping(value = "/login")
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {

		// 1번
		logger.info("{code:}",code);
		
		// 2번
		String access_Token = iKakaoS.getAccessToken(code);
		// log.warn("###access_Token#### : " + access_Token);
		// 위의 access_Token 받는 걸 확인한 후에 밑에 진행
		
		// 3번
		// HashMap<String, Object> userInfo = iKakaoS.userInfo(access_Token);
		// System.out.println("###nickname#### : " + userInfo.get("nickname"));
		// System.out.println("###email#### : " + userInfo.get("email"));
		
		
		return null;	
    }
}
