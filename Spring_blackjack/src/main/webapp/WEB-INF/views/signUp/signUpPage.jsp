<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<html>
<head>
	<link rel="stylesheet" href="resources/css/Header.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/gameInfoPage.css"  type="text/css" />
	<title>회원가입 페이지</title>
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

		<div class="column middle">
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			<div class="container">
				<h2 style="color:#454194;">MEMBERSHIP</h2>
					<table>
						<tr>
							<td style='width: 100px'>아이디</td>
							<td><input type="text" size=25 name="userNM" value="">
							<input type="button" id="checkid" value="중복체크"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" size=37 name="Password"></td>
						</tr>
						<tr>
							<td>비밀번호(확인)</td>
							<td><input type="password" size=37 name="rePassword"></td>
						</tr>
						<tr>
							<td>휴대폰번호</td>
							<td><input type="text" size=37 name="mobileNO" value=""></td>
						</tr>
						<tr>
							<td>E-Mail</td>
							<td><input type="text" size=37 name="email" value=""></td>
						</tr>
						<tr>
							<td style='width: 100px'>이름</td>
							<td><input type="text" size=37 name="userNM" value=""></td>
						</tr>
						<tr>
							<td style='width: 100px'>성별</td>
							<td>
								<select name="gender">
								<option value="남성">남성</option>
								<option value="여성" selected="selected">여성</option>
								</select>
							</td>
						</tr>
						
					</table>
					
			</div>

				<button class="button" style="vertical-align:middle">
				<span>회원가입 </span></button>

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
		</div>
	
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
   </div>
   
</body>
</html>





