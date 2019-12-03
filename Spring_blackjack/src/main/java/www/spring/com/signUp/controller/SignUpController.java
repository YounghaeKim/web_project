package www.spring.com.signUp.controller;

import java.util.List;

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
	
	@RequestMapping("/signUp.do")
	public String listAllBoard(Model model) {
		List<UserVO> listAllBoard = boardService.getAllBoard();
		model.addAttribute("listAllCustomer", listAllBoard);
		return "signUp/signUpPage";
	}
}
