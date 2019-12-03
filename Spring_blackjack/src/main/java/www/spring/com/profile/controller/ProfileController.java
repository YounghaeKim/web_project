package www.spring.com.profile.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.spring.com.profile.service.ProfileService;
import www.spring.com.user.model.UserVO;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService boardService;//서비스에 연결시킨다.
	
	@RequestMapping("/profile.do")
	public String listAllBoard(Model model) {
		List<UserVO> listAllBoard = boardService.getAllBoard();
		model.addAttribute("listAllCustomer", listAllBoard);
		return "profile/profilePage";
	}
}
