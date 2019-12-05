package www.spring.com.signUp.controller;

import java.util.List;

import org.apache.ibatis.logging.log4j2.Log4j2AbstractLoggerImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.spring.com.signUp.service.SignUpService;
import www.spring.com.user.model.UserVO;

@Controller
public class SignUpController {
	
	@Autowired
	private SignUpService boardService;//서비스에 연결시킨다.
	
	@RequestMapping("/signUp.do") //회원가입 페이지 이동
	public String openSignUpPage(Model model) {
		return "signUp/signUpPage";
	}
	
	@RequestMapping("/memberSingUp.do")//
	public String signUp(UserVO signUpRequestUser) { //회원가입 요청 처리 후 회원가입 성공하면 로비로이동
		
		
		return "robby/robbyPage";
	}
}
