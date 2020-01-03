<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
   <link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
   <link rel="stylesheet" href="/resources/css/profilePage.css"  type="text/css" />
<head>
   <title>프로필</title>
</head>
<body>
   
   
   <%@include file="../includes/header.jsp"%>
        
        <div class="row">
        <div class="column side">
         <h2>advertisement</h2>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
      </div>

      <div class="column middle">
         <!--
      <img alt="casino" src="resources/img/main.png" style="width:100%">
        -->
          <h2>보유금액 ${currentUser.currentCash}</h2><br>
          <h4>고유번호 ${currentUser.customerNumber}</h4><br>
          <!-- 버튼 클릭시 내용물이 사라지고 인풋 텍스트 박스로 변경 
          동적 삭제 동적 추가-->
          <form action="changeProfile.do">
            <h4>
               프로필
               <button id="button" type=submit>프로필 변경</button>
            </h4><br>
            <h4>
               아이디 &nbsp;
               <button id="button" type=submit>아이디 변경</button>
               ${currentUser.id}
            </h4><br>
            <h4>
               비밀번호&nbsp;
               <button id="login_button" type=submit>비밀번호 변경</button>
               ${currentUser.password}
            </h4><br>
            <h4>
               전화번호 &nbsp;
               <button id="login_button" type=submit>전화번호 변경</button>
               ${currentUser.phoneNumber}
            </h4><br>
            <h4>
               이메일 ${currentUser.email}&nbsp;
               <button id="login_button" type=submit>이메일 변경</button>
            </h4><br>
            <h4>
               이름 &nbsp;
               <button id="login_button" type=submit>이름 변경</button>
               ${currentUser.name}
            </h4><br>
            <h4>
               성별 &nbsp;
               <button id="login_button" type=submit>성별 변경</button>
               ${currentUser.gender}
            </h4><br>
            <button id="login_button" type=submit>개인정보 변경</button>
         </form>

         <br><br>
      </div>
   
      
      <div class="column side">
         <h2>advertisement</h2>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
      </div>
   </div>
</body>
</html>