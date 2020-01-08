<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<script src="/resources/jQuery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
	<link rel="stylesheet" href="/resources/css/boardPage.css"  type="text/css" />
	
	<title>Board Register</title>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	  	
	  	<div class="row">
	  	<div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>

		<div class="column middle">
			<h1 style="color:#0B3B2E; font-family:verdana;">Q&A Board Register</h1>
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			  <div class="panel-default">
			  	<div class="panel-head">질문 상세 게시판</div>
			  
				  <div class="panel-body">
						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
						</div>			
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						
						<button data-oper="modify" class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'">수정</button>
						<button data-oper="list" class="btn btn-info" onclick="location.href='/board/list'">리스트</button>
					
				</div>	
			</div>
		</div>
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
		
   </div><!-- row End -->
   
</body>
</html>