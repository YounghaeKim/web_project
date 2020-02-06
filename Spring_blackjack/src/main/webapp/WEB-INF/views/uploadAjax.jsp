<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<button id="uploadBtn">Upload</button>

<script src="http://code.jquery.com/jquery-3.3.1.min.js" 
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" 
	crossorigin="anonymous">
	</script>

<script>
$(document).ready(function(){
	
	$("#uploadBtn").on("click",function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		//첨부파일 전송
		for (var i = 0; i < files.length; i++) {
			
			formData.append("uploadFile", files[i]);//첨부파일 데이터 추가
		}
		
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false,
			contentType: false, //processData, contentTypesms를 'false'로 지정해야만 전송된다.
			data: formData, //ajax를 통해서 formData 자체를 전송한다.
			type: 'POST',
			success: function(result){
				alert("Uploaded");
			}
		});//$.ajax
		
	});
});

</script>


</body>
</html>