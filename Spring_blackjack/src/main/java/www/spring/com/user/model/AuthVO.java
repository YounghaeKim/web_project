package www.spring.com.user.model;

import lombok.Data;

@Data
public class AuthVO {
   public static final String ROLE_MEMBER = "ROLE_MEMBER";
   public static final String ROLE_ADMIN = "ROLE_ADMIN";
   
    private int customerNumber;
    private String auth;
}