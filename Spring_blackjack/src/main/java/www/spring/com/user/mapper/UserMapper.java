package www.spring.com.user.mapper;

import org.apache.ibatis.annotations.Param;

import www.spring.com.user.model.UserVO;

public interface UserMapper {
   public UserVO findUser(UserVO findingUser);
   public UserVO loginRequest(String logInRequestID);
   public void signUpRequest(UserVO signUpRequestUser);
   public void giveRole(@Param("id") String id, @Param("auth") String auth);
}