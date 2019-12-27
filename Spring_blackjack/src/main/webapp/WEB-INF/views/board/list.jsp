<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<link rel="stylesheet" href="resources/css/header.css"  type="text/css" />
	<link rel="stylesheet" href="resources/css/boardPage.css"  type="text/css" />
	<title>게시판</title>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	  	
	  	<div class="row">
	  	<div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>

		<div class="column middle">
			<h1 style="color:#F7F8E0; font-family:verdana; text-align:center; background-color:DodgerBlue;">고객 게시판</h1>
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			<table id="customers">
				<thead>
				  <tr> 
				    <th>#번호</th>
				    <th>제목</th>
				    <th>작성자</th>
				    <th>작성일</th>
				    <th>수정일</th>
				  </tr>
				</thead>
				
				<c:forEach items="${list}" var="board">
					<tr>
						<td><c:out value="${board.bno}" /></td>
						<td><c:out value="${board.title}" /></td>
						<td><c:out value="${board.writer}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
					</tr>
				</c:forEach>
				
			</table>
		</div>
	
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
		
   </div><!-- row End -->
   
</body>
</html>





