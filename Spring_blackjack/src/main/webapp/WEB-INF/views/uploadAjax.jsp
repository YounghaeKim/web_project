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
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //바이러스 방지용 확장자 제어
	var maxSize = 5242880; //5MB
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){//파일 사이즈 검사 5MB 이상은 경고문구가 뜬다.
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){ //exe|sh|zip|alz 종류의 파일 형식을 올릴 경우 경고문구뜬다.
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	$("#uploadBtn").on("click",function(e){
		
		var formData = new FormData();
		
		var inputFile = $("input[name='uploadFile']");
		
		var files = inputFile[0].files;
		
		console.log(files);
		
		//첨부파일 전송
		for (var i = 0; i < files.length; i++) {
			
			if (!checkExtension(files[i].name, files[i].size)) {
				return false //파일 검사 
			}
			
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