package www.spring.com.profile.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.UserVO;

@Service
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private UserMapper userMapper;

	@Override
	public UserVO getCurrentUser(UserVO findingUser) {
		UserVO findedUser = userMapper.findUser(findingUser);
		return findedUser;
	}
	
}
