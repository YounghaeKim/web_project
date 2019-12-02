package www.spring.com.signUp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.userMapper;
import www.spring.com.user.model.userVO;

@Service
public class signUpServiceImpl implements SignUpService{

	@Autowired
	private userMapper boardMapper;
	
	@Override
	public List<userVO> getAllBoard() {
		List<userVO> listAllBoard = boardMapper.getAllBoard();
		return listAllBoard;
	}
	
}
