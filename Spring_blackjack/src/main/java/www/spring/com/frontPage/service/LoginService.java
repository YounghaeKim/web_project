package www.spring.com.frontPage.service;

import javax.servlet.http.HttpSession;

import www.spring.com.user.model.UserVO;

public interface LoginService {
	
	// 회원 로그인 체크
	public boolean loginCheck(UserVO logInRequestUser, HttpSession logInRequestSession);
}
