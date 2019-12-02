package www.spring.com.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.userMapper;
import www.spring.com.user.model.userVO;

@Service
public class profileServiceImpl implements profileService{

	@Autowired
	private userMapper boardMapper;
	
	@Override
	public List<userVO> getAllBoard() {
		List<userVO> listAllBoard = boardMapper.getAllBoard();
		return listAllBoard;
	}
	
}
