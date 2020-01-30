<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
	<script src="/resources/jQuery/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
	<link rel="stylesheet" href="/resources/css/getPage.css"  type="text/css" />
	
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
		                     <label><strong>Bno</strong></label> <input class="form-control" name="bno"
		                     value='<c:out value="${board.bno}"/>' readonly="readonly">
		                  </div>
		                  
		                  <div class="form-group">
		                     <label><strong>제목</strong></label> <input class="form-control" name="title"
		                     value='<c:out value="${board.title}"/>' readonly="readonly">
		                  </div>
		                  
		                  <div class="form-group">
		                     <label><strong>내용</strong></label>
		                     <textarea class="form-control" rows="7" name='content' readonly="readonly"><c:out value="${board.content}" /></textarea>
		                  </div>         
		                  
		                  <div class="form-group">
		                     <label><strong>작성자</strong></label> <input class="form-control" name="writer"
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
			<!-- end panel-default -->
			
			<!-- Start Reply -->
			<div class="panel panel-default">
				<!-- <div class="panel-head">
					<i class="fa fa-comments fa-fw"></i> Reply
				</div>
				-->
				<div class="panel-head">
					<i class="fa fa-comments fa-fw"></i> Reply
					<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">New Reply</button>
				</div>
			
			
			
				<div class="panel-body">
					
					<ul class="chat">
						<li class="left clearfix" data-rno='12'>
							<div>
								<div class="panel-head2">
									<strong class="primary-font">user00</strong>
									<small class="pull-right text-muted">2018-01-01 13:13</small>
								</div>
								<p>Good job!</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!-- End Reply -->
			
		</div>
	   
	   <div class="column side">
			<h2>advertisement</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
		</div>
		
   </div><!-- row End -->
   
   
<!-- Modal Start -->
<div class="modal hidden" id="myModal">
	 <div class="modal_overlay"></div>
	 <div class="modal_content">
     <div class="modal-header">
       <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times</button>
      <h4 class="modal-title" id=myModalLabel>REPLY MODAL</h4>
     </div>

     <div class="modal-body">
       <div class="form-group">
         <label>REPLY</label>
         <input class="form-control" name="reply" value="NewReply!!!!">
       </div>

       <div class="form-group">
         <label>REPLYER</label>
         <input class="form-control" name="replyer" value="replyer">
       </div>

       <div class="form-group">
         <label>REPLY DATE</label>
         <input class="form-control" name="replyDate" value="">
       </div>

     </div>
	    


    <div class="modal-footer">
      <button id="modalModBtn" type="button" class="btn btn-warnig">Modify</button>
      <button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
      <button id="modalRegisterBtn" type="button" class="btn btn-primary">Regiter</button>
      <button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
	  </div>
   </div>
 
  </div>

<!-- Modal End -->


<script type="text/javascript" src="/resources/js/reply.js"></script>
<!--  
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
-->

<script>
$(document).ready(function() {
	
	var bnoValue = '<c:out value="${board.bno}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		
		replyService.getList({bno:bnoValue,page: page|| 1}, function(list) {
			
			var str="";
			if (list == null || list.length == 0) {
				replyUL.html("");
				
				return;
			}
			for (var i = 0,  len = list.length || 0; i <len; i++) {
				str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
				str +="	<div><div class='panel-head2'><strong class='primary-font'>"+list[i].replyer+"</strong>";
				str +="		<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
				str +="		<p>"+list[i].reply+"</p></div></li>";
			}
			
		replyUL.html(str);
			
		});//end function
	}//end showList
	
	var modal = $(".modal");
	var modalInputReply = modal.find("input[name='reply']");
	var modalInputReplyer = modal.find("input[name='replyer']");
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	var modalModBtn = $("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	
	$("#addReplyBtn").on("click", function(e) {
		
		modal.find("input").val("");
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();		
		
		modalRegisterBtn.show();
		
		$(".modal").css("display","flex");
	});
	
	 $("#modalCloseBtn").on("click", function(){
		 $(".modal").css("display","none");
	   });
	
	modalRegisterBtn.on("click",function(e){
		
		var reply = {
				reply: modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno:bnoValue
			};
		replyService.add(reply, function(result){
			
			alert(result);
			
			modal.find("input").val("");
			$(".modal").css("display","none");
			
			showList(1);
		});
		
		
	});
	
	
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