<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<link rel="stylesheet" href="resources/css/Header.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/profilePage.css"  type="text/css" />
<head>
	<title>프로필</title>
</head>
<body>
	
	
	<div class="header">
	<h1 style="color:#F2F2F0;">개인 프로필</h1>
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
		 
			<h2>프로필</h2><br>
			
			<h4>고유번호 ${currentUser.customerNumber}</h4><br>
			<h4>아이디 ${currentUser.id}</h4><br>
			<h4>패스워드 ${currentUser.password}</h4><br>
			<h4>전화번호 ${currentUser.phoneNumber}</h4><br>
			<h4>이메일 ${currentUser.email}</h4><br>
			<h4>이름 ${currentUser.name}</h4><br>
			<h4>성별 ${currentUser.gender}</h4><br>
			<h4>보유금액 ${currentUser.currentCash}</h4><br>
			<h4>회원가입일 
			</h4><br>
			<br><br>
		
			<button id="robby_button" type="button" onclick="location.href='robby.do' ">게임 생성</button>
			<button id="cashCharging_button" type="button" onclick="location.href='cashCharging.do' ">캐쉬 충전</button>
			
		</div>
	
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
   </div>
	
	
	<table>
		<tr>
			<th>Current cash</th>
		</tr>
		<c:forEach var="Customer" items="${listAllCustomer}">
			<tr>
				<td>${Customer.currentCash}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
