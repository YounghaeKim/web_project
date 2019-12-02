package www.spring.com.frontPage.controller;

import java.util.Locale;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class frontController {
	
	private static final Logger logger = LoggerFactory.getLogger(frontController.class);
	@Autowired
	private LoginService loginService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("로그인 화면", locale);
		
		return "front/frontPage";
	}
	
	// 로그인
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public ModelAndView loginCheck(@ModelAttribute UserVO loginInfo) {
		boolean result = loginService.loginCheck(loginInfo);
		ModelAndView mav = new ModelAndView();
		if(result == true) {	// 로그인 성공
			// robby.jsp로 이동
			mav.setViewName("robby");
			// !!로그인 안해도 로비 이동 가능!!
		} else {	// 로그인 실패
			// frontPage.jsp로 이동
			mav.setViewName("front/frontPage");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
}
