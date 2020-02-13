<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style>

.uploadResult {
	width : 100%;
	background-color: #E6E6E6;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 25px;
}

</style>

</head>
<body>
<h1>Upload with Ajax</h1>

<div class="uploadDiv">
	<input type="file" name="uploadFile" multiple>
</div>

<div class="uploadResult">
	<ul>
	
	</ul>
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
	
	var cloneObj = $(".uploadDiv").clone();
	// └<input type="file">객체가 포함된 div를 복사(cloen)한다.
	
	
	var uploadResult = $(".uploadResult ul");
		
		function showUploadedFile(uploadResultArr) {
			// └json 데이터를 받아서 해당 파일의 이름을 추가합니다. 
			
			var str = "";
			
			$(uploadResultArr).each(function(i, obj) {
				
				if (!obj.image) { //이미지 파일이 아닐경우 attach 이미지파일을 보여준다.
					str += "<li><img src='/resources/img/attach.png'>" + obj.fileName + "</li>";
				} else { 
					//str += "<li>" + obj.fileName + "</li>";
					
					var fileCallPath = encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid+"_"+obj.fileName);
					
					str += "<li><img src='/display?fileName="+fileCallPath+"'><li>";
				}
			});
			
			uploadResult.append(str);
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
			dataType: 'json', //ajax를 호출했을때 결과 타입(data type)을 'json'으로 변경한다. 
			success: function(result){

				console.log(result); //브라우저에서 결과 출력	
				
				showUploadedFile(result); //화면에 업로드 된 파일의 이름을 출력해준다.
				
				$(".uploadDiv").html(cloneObj.html());
				// └첨부파일을 업로드 한 후 복사된 객체를 div 내에 다시 추가해서 첨부파일 부분을 초기화 시킨다.
				
			}
		});//$.ajax
		
	});
});

</script>


</body>
</html>