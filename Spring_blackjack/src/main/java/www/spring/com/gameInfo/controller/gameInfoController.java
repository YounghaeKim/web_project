package www.spring.com.gameInfo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class gameInfoController {
	@RequestMapping("/gameInfo.do")
	public String listAllBoard(Model model) {
		return "gameInfo/gameInfoPage";
	}
}
