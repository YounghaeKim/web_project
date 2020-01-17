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
         <img  class="Plogo" alt="E-301_zeta" src="resources/img/E-301_zeta.jpg">
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
            <fieldset style="color:black">
               <legend><h2>♀ Profile ♂</h2></legend>
            
               <h4>
                 <label for="id"> ❡ ID ☪ &nbsp;
                  :</label>  <input type="text" id="id">   <button id="button" type=submit>아이디 변경</button>
                  ${currentUser.id}
               </h4><br>
               <h4>
                 <label for="password"> ❡ Password ☪&nbsp;
                  :</label>  <input type="password" name="password" id="password">   <button id="login_button" type=submit>비밀번호 변경</button>
                  ${currentUser.password}
               </h4><br>
               <h4>
                <label for="tel"> ❡ Phone Number ☪ &nbsp;
                  :</label>  <input id="tel" type="tel" name="tel" required pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" title="###-####-####">   <button id="login_button" type=submit>전화번호 변경</button>
                  ${currentUser.phoneNumber}
               </h4><br>
               <h4>
                  <label for="email"> ❡ E-mail ☪ ${currentUser.email}&nbsp;
                 :</label>  <input id="email" type="email" name="email" required>   <button id="login_button" type=submit>이메일 변경</button>
               </h4><br>
               <h4>
                <label for="name">  ❡ Name ☪ &nbsp;
                :</label>  <input id="name" type="text" name="name">   <button id="login_button" type=submit>이름 변경</button>
                  ${currentUser.name}
               </h4><br>
               <h4>
                 <label for="sex"> ❡ Sex ☪ &nbsp;
                  :</label>  <input id="sex" type="radio" name="sex" value="Male">Male
                              <input id="sex" type="radio" name="sex" value="Female">Female   <button id="login_button" type=submit>성별 변경</button>
                  ${currentUser.gender}
               </h4><br>
               <button id="login_button" type=submit>개인정보 변경</button>
               <br>
               <br>
            </fieldset>
         </form>

         <br><br>
      </div>
   
      
      <div class="column side">
         <img class="Plogo"  alt="SilverBot(2)" src="resources/img/SilverBot(2).jpg">
      </div>
   </div>
</body>
</html>