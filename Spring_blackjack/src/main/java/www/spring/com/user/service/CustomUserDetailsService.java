package www.spring.com.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import www.spring.com.user.mapper.UserMapper;
import www.spring.com.user.model.AuthVO;
import www.spring.com.user.model.CustomUser;
import www.spring.com.user.model.UserVO;

@Service
public class CustomUserDetailsService implements UserDetailsService {

   @Autowired
   private UserMapper userMapper;
   @Autowired
   private BCryptPasswordEncoder passwordEncoder;
   
   @Override
   public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
      UserVO userVO = userMapper.loadUserByUserID(id);   
      
      if(userVO == null)//없는 아이디
         throw new UsernameNotFoundException(id);
      
      List<GrantedAuthority> authorities = new ArrayList<>();
      for(AuthVO auth : userVO.getAuthList()) {
         authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
      }
      
      CustomUser user = new CustomUser(userVO.getId(), userVO.getPassword(), authorities);
      return user;
   }

   @Transactional//회원가입 과정 트랜젝션으로 실행
 //인터페이스로 구현되지 않은 함수라서 트랜젝션시 proxy-target-class="true"(root-context에) 선언 필요
   public void createUser(UserVO signUpRequestUser) {
      String EncodedPassword = passwordEncoder.encode(
            signUpRequestUser.getPassword());//저장할 비밀번호 암호화
      
      userMapper.signUpRequest(signUpRequestUser.getId(), EncodedPassword);
      userMapper.makeDetails(signUpRequestUser);
      userMapper.giveRole(signUpRequestUser.getId(), AuthVO.ROLE_MEMBER);//유저 멤버 권한
   }
   
   public void updateUser(UserDetails user) {
      // TODO Auto-generated method stub

   }

   public void deleteUser(String username) {
      // TODO Auto-generated method stub

   }

   public void changePassword(String oldPassword, String newPassword) {
      // TODO Auto-generated method stub

   }

   public boolean userExists(String username) {
      // TODO Auto-generated method stub
      return false;
   }

}