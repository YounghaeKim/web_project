package www.spring.com.signUp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.AuthVO;
import www.spring.com.user.model.UserVO;

@Service
public class SignUpServiceImpl implements SignUpService{

   @Autowired
   private UserMapper userMapper;

   @Override
   public void requestSignUp(UserVO signUpRequestUser) {
      userMapper.signUpRequest(signUpRequestUser); //회원가입
      userMapper.giveRole(signUpRequestUser.getId(), AuthVO.ROLE_MEMBER);//멤버 권한 부여
   }
}