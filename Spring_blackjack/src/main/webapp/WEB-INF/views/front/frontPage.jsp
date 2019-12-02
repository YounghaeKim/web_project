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
  		<li><a class="active" href="/">Home</a></li>
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
			<form name="loginCheck.do" method="post">
				<div class="textbox">
					<label for="ex_input">아이디</label> <input type="text" id="ex_input">
				</div>
	
				<div class="textbox">
					<label for="ex_input2">패스워드</label> <input type="password"
						id="ex_input2">
				</div>
			<div id="login">
			<button id="login_button" type="button" onclick="location.href='robby.do' ">로그인</button>
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
