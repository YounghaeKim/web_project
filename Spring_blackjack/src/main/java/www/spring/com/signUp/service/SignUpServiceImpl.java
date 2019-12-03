package www.spring.com.signUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.UserVO;

@Service
public class SignUpServiceImpl implements SignUpService{

	@Autowired
	private UserMapper boardMapper;
	
	@Override
	public List<UserVO> getAllBoard() {
		List<UserVO> listAllBoard = boardMapper.getAllBoard();
		return listAllBoard;
	}
	
}
