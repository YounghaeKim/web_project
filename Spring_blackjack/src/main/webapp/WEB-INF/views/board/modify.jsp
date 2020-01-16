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
			<h1 style="color:#0B3B2E; font-family:verdana;">Q&A Board Modify</h1>
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			  <div class="panel-default">
			  	<div class="panel-head" style="color: red">게시판 수정</div>
			  
				  <div class="panel-body">
				  <form role="form" action="/board/modify" method="post">
						<div class="form-group">
							<label>Bno</label> <input class="form-control" name="bno"
							value='<c:out value="${board.bno}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>제목</label> <input class="form-control" name="title"
							value='<c:out value="${board.title}"/>' >
						</div>
						
						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="7" name='content' ><c:out value="${board.content}" /></textarea>
						</div>			
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>RegDate</label> <input class="form-control" name="regDate"
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}"/>' readonly="readonly">
						</div>
						
						<div class="form-group">
							<label>Update Date</label> <input class="form-control" name="updateDate"
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate}"/>' readonly="readonly">
						</div>
						
						<button type="submit" data-oper="modify" class="btn btn-default">수정</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
						<button type="submit" data-oper="list" class="btn btn-info">리스트</button>
					
					
						<!-- 수정과 삭제처리  -->
						<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
						<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
						<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
						<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
						<!-- 수정과 삭제처리 END -->
					</form>
				</div>	 
			</div>
		</div>
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
		
   </div><!-- row End -->
   
<script type="text/javascript">
$(document).ready(
 function() {
	
	 var formObj = $("form");
	 
	 $("button").on("click", function(e){
		   
		 e.preventDefault();
		 
		 var operation = $(this).data("oper");
		 
		 console.log(operation);
		 
		 if (operation === "remove") {
			 formObj.attr("action", "/board/remove");
		} else if (operation === "list"){
			//move to list
			formObj.attr("action", "/board/list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			var typeTag = $("input[name='type']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
			
		}
		 
		 formObj.submit();
	 
	 });
 });
</script>
</body>
</html>















