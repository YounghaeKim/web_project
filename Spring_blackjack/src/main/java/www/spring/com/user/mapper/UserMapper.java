package www.spring.com.user.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.userdetails.UserDetails;

import www.spring.com.user.model.UserVO;

public interface UserMapper {
   //회원가입
   public void signUpRequest(@Param("id") String id, @Param("password") String password);
   //가입한 회원의 디테일 정보 생성
   public void makeDetails(UserVO createUserID);
   //가입한 회원의 권한 부여
   public void giveRole(@Param("id") String id, @Param("auth") String auth);
   //로그인 요청
   public UserVO loadUserByUserID(String id);
}