package www.spring.com.user.model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomUser extends User {

   private UserVO userDetails;

   public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
      super(username, password, authorities);
   }

   public UserVO getUserDetails() {
      return userDetails;
   }

   public void setUserDetails(UserVO userVO) {
      this.userDetails = userVO;
   }
   
}