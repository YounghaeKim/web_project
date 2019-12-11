<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="stylesheet" href="resources/css/Header.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/frontPage.css"  type="text/css" />
	<title>초기 페이지</title>
	
</head>
<body>
	<div class="header">
	<h1 style="color:#F2F2F0;">AICASINO</h1>
	</div>
	
	<div class="topnav">
	<ul>
  		<li><a class="active" href="/"></a></li>
		<li><a href="signUp.do">회원가입</a></li>
		<li><a href="robby.do">QnA</a></li>
		<li><a href="gameInfo.do">게임설명</a></li>
		<li><a href="profile.do">개인정보</a></li>
	</ul>
	</div>
	
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
					<label for="id">아이디</label> 
					<input type="text" id="id" name="id">
				</div>
				<div class="textbox">
					<label for="password">패스워드</label> 
					<input type="password" id="password" name="password">
				</div>
			<c:if test="${msg == 'loginFail'}">
				<script>
     				alert( '아이디 또는 비밀번호가 일치하지 않습니다.' );
    			</script>
			</c:if>
			<div id="login">
			<button id="login_button" type=submit>로그인</button>
	    	</div>
			</form>
	  	</div>
	  	
	  	
	    <div class="column middle">
		<img alt="casino" src="resources/img/main.png" style="width:100%">
	   </div>
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
   </div>
   
</body>
</html>
