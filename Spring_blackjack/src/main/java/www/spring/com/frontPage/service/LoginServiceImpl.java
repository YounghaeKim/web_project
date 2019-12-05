package www.spring.com.frontPage.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.UserVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public boolean loginCheck(UserVO logInRequestUser, HttpSession logInRequestSession) {
		UserVO searchedUser = userMapper.loginRequest(logInRequestUser);//아이디로 찾아진 유저
		//아이디 비번 둘다 맞으면 트루, 둘 중 하나라도 틀리면 펄스
		
		if (searchedUser == null)// 없는 아이디
			return false;
		
		if (logInRequestUser.getPassword().equals(searchedUser.getPassword()))//비밀번호가 맞다면
			//로그인 세선에 유저 등록
			logInRequestSession.setAttribute("sessionUser", searchedUser);
		
		return logInRequestUser.getPassword().equals(searchedUser.getPassword());
	}

}