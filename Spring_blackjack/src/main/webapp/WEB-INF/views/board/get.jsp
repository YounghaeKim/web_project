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
			<h1 style="color:#0B3B2E; font-family:verdana;">Q&A Board Info</h1>
			<!--
		<img alt="casino" src="resources/img/main.png" style="width:100%">
		  -->
			  <div class="panel-default">
			  	<div class="panel-head" style="color: blue">질문 상세 게시판</div>
			  
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
							<textarea class="form-control" rows="7" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
						</div>			
						
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer}"/>' readonly="readonly">
						</div>
						
						<button data-oper="modify" class="btn btn-default">수정</button>
						<button data-oper="list" class="btn btn-info">리스트</button>
						
						<form id="operForm" action="/board/modify" method="get">
							<input type="hidden" id="bno" name="bno" value="<c:out value='${board.bno}'/>">
							<input type="hidden" name="pageNum" value="<c:out value='${cri.pageNum}'/>">
							<input type="hidden" name="amount" value="<c:out value='${cri.amount}'/>">
							<input type="hidden" name="keyword" value="<c:out value='${cri.keyword}'/>">
							<input type="hidden" name="type" value="<c:out value='${cri.type}'/>">
						</form>
					
				</div>	
			</div>
		</div>
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
		
   </div><!-- row End -->

<script type="text/javascript" src="/resources/js/reply.js"></script>

<script>

console.log("=======================");
console.log("JS TEST");

var bnoValue = '<c:out value="${board.bno}"/>';

replyService.getList({bno:bnoValue, page:1}, function(list){

	for (var i = 0,  len = list.length || 0; i <len; i++) {
		console.log(list[i]);
	}
});
//13번 댓글 삭제 테스트
replyService.remove(13, function(count){
	
	console.log(count);
	
	if (count === "success") {
		alert("REMOVED");
	}
}, function(err) {
	alert('ERROR...');
});

//12번 댓글 수정
replyService.update({
	rno : 12,
	bno : bnoValue,
	reply : "Modified Reply...."
}, function(result) {
	alert("수정완료...");
});

//10번 조회
replyService.get(10, function(data){
	console.log(data);
	
});

</script>


<script type="text/javascript">
$(document).ready(function() {
	
	console.log(replyService);
});
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	 var operForm = $("#operForm");
	 
	 $("button[data-oper='modify']").on("click", function(e){
		
		 operForm.attr("action","/board/modify").submit();
		
	 });
	
	 $("button[data-oper='list']").on("click", function(e){
	 
	 operForm.find("#bno").remove();
	 operForm.attr("action","/board/list")
	 operForm.submit();
	 
	 });
 });
</script>


</body>
</html>