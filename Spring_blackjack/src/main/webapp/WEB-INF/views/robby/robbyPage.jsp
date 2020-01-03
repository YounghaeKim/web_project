<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
	<link rel="stylesheet" href="/resources/css/robbyPage.css"  type="text/css" />
	<title>로비 페이지</title>
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






