package www.spring.com.robby.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.spring.com.robby.service.RobbyService;

@Controller
public class RobbyController {
	
	@Autowired
	private RobbyService boardService;//서비스에 연결시킨다.
	
	@RequestMapping("/member/robby.do")
	public String listAllBoard(Model model) {
		return "robby/robbyPage";
	}
}
