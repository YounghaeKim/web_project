package www.spring.com.profile.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.spring.com.profile.service.ProfileService;
import www.spring.com.user.model.UserVO;

@Controller
public class ProfileController {
	
	//@Autowired
	//private ProfileService profileService;//서비스에 연결시킨다.
	
	@RequestMapping("/profile.do")
	public String getCurrentUserInfo(HttpSession session, Model model) {
		//세션에 저장된 유저 넘버로 개인정보를 가져온다.\
		model.addAttribute("currentUser", (UserVO) session.getAttribute("sessionUser"));
		return "profile/profilePage";
	}
}
