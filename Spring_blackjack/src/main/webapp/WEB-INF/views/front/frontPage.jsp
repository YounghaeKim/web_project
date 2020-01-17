<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
   <link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
   <link rel="stylesheet" href="/resources/css/frontPage.css"  type="text/css" />
   <title>초기 페이지</title>
   
   <script language="javascript">
      function loginFailPopUp() { window.open("08_2_popup.html", "a", "width=400, height=300, left=100, top=50"); }
   </script>
   
</head>
<body>

   <%@include file="../includes/header.jsp"%>
   
   <div class="row">
      <div class="column side">
         <h2>advertisement</h2>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
      </div>

      <div class="column left"> 
         <img alt="casino" src="resources/img/LOGO_2.png" style="width:20%">
         <br><br>
         <form name="loginCheck" method="post" action="loginCheck.do"><!-- 로그인 체크, 포스트 -->
            <div class="textbox">
               <label for="id"></label> 
               <input type="text" id="id" name="id" placeholder="ID">
            </div>
            <div class="textbox">
               <label for="password"></label> 
               <input type="password" id="password" name="password" placeholder="Password">
            </div>
         <c:if test="${msg == 'loginFail'}">
            <script>
                 alert( '아이디 또는 비밀번호가 일치하지 않습니다.' );
             </script>
         </c:if>
         <div id="login">
         <button id="login_button" type=submit>Login</button>
          </div>
         </form>
         
         
          <div id="robby">
         <button id="robby_button" type="button" onclick="location.href='signUp.do' ">Sign Up</button>
          </div>
          
        </div>
        
        
       <div class="column middle">
      <img alt="casino" src="resources/img/main.png" style="width:100%; height: auto;">
      </div>
      
      <div class="column side">
         <h2>advertisement</h2>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
      </div>
   </div>
   
   <br>
   <audio src="resources/mp3/NeverMind.mp3" autoplay loop>
   
</body>
</html>