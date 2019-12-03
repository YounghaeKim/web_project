package www.spring.com.frontPage.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import www.spring.com.frontPage.service.LoginService;
import www.spring.com.user.model.UserVO;

@Controller
public class FrontController {
	
	private static final Logger logger = LoggerFactory.getLogger(FrontController.class);
	@Autowired
	private LoginService loginService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("로그인 화면", locale);
		
		return "front/frontPage";
	}
	//view -> controller -> service -> mapper.java -> mapper.xml
	@RequestMapping(value = "/loginCheck.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView loginCheck(@ModelAttribute UserVO logingUser, HttpSession logingSession) {
		System.out.println("로그인 체크 시작");
		System.out.println(logingUser.getId() +" 로그인 요청");
		
		ModelAndView mav = new ModelAndView();//뷰에 모델(데이터)을 전송할 수 있는 타입
		if (loginService.loginCheck(logingUser, logingSession)) {//로그인 성공
			mav.setViewName("robby/robbyPage");;
			System.out.println("로그인 성공");
		} else {//로그인 실패
			mav.setViewName("front/frontPage");
			mav.addObject("msg", "loginFail");//실패 메시지
			System.out.println("로그인 실패");
		}
		return mav;
	}
	
}
