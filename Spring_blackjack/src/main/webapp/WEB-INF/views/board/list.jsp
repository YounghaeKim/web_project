<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
   <script src="/resources/jQuery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="/resources/css/header.css"  type="text/css" />
   <link rel="stylesheet" href="/resources/css/boardPage.css"  type="text/css" />
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
         <div class="panel-heading" >
            <button id="regBtn" type="button" class="btn">새로운 글 작성</button>
            <div class="headTxt"><p>Board List Page</p></div>
         </div>
         
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
                  <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'>
                  <c:out value="${board.title}" /></a></td>
                  <td><c:out value="${board.writer}" /></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                  <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
               </tr>
            </c:forEach>
            
         </table><!-- table End -->
         
      </div>
   
      
      <div class="column side">
         <h2>advertisement</h2>
         <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit..</p>
      </div>
      
   </div><!-- row End -->
   
   <!-- Modal 추가 -->
        <div class="modal hidden" id="myModal">
            <div class="modal_overlay"></div>
            <div class="modal_content">
               <div class="content">
              <h3>처리가 완료되었습니다.</h3>
              </div>
              <div class="modal_button">
              <button type="button">CLOSE</button>
              </div>
           </div>
        </div>
         
         <!-- Modal End -->
   
<script type="text/javascript">
$(document).ready(
 function() {
    
    var result = '<c:out value="${result}"/>';
    
    checkModal(result);
    
    history.replaceState({},null,null);
    
    function checkModal(result) {
       
       if (result === '' || history.state) {
         return;
      }
       if (parseInt(result) > 0) {
          
          $(".content").html("게시글 " + parseInt(result) + " 번이 등록되었습니다." + "<br><br>");
      }
   
       $('div').removeClass("hidden");
      
    }
   $(".modal_button").on("click", function(){
      $("#myModal").fadeOut(300);
   });
    
   $("#regBtn").on("click", function(){
   
     self.location = "/board/register";
     alert("누르지마");
   });
 });

</script>
   
</body>
</html>




