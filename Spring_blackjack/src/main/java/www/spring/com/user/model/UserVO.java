package www.spring.com.user.model;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
   
   private int customerNumber;
   private String id;   
   private String password;
   private String phoneNumber;
   private String email;
   private String name;
   private String gender;
   private long currentCash;
   private long totalAmount;
   private int winRate;
   private Date registrationDate;
   private List<AuthVO> authList;
   
   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + customerNumber;
      return result;
   } //
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      UserVO other = (UserVO) obj;
      if (customerNumber != other.customerNumber)
         return false;
      return true;
   } //set할때 중복 검사 한다. 

}