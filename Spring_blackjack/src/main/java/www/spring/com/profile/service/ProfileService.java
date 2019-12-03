package www.spring.com.profile.service;

import java.util.List;

import www.spring.com.user.model.UserVO;

public interface ProfileService {
	public UserVO getCurrentUser(UserVO findingUser);
}
