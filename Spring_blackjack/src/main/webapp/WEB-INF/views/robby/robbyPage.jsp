<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="stylesheet" href="resources/css/Header.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/robbyPage.css"  type="text/css" />
	<title>로비 페이지</title>
</head>
<body>
	<div class="header">
	<h1 style="color:#F2F2F0;">GAME ROBBY</h1>
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

		<div class="column middle">
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			<h2>BLACKJACK</h2><br>
			
			
			<br><br>
		
			<button id="robby_button" type="button" onclick="location.href='robby.do' ">게임 생성</button>
			<button id="cashCharging_button" type="button" onclick="location.href='cashCharging.do' ">캐쉬 충전</button>
			
		</div>
	
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
   </div>
   
</body>
</html>






