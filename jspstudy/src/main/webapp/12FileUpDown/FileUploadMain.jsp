<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드</title>
</head>
<body>
	<h4>파일업로드</h4>
	<span style="color: red">${errMsg}</span>
	<form name="fileForm" method="post" enctype="multipart/form-data"
		action="UploadProc.jsp" onsubmit="return  validationForm(this);">
			작성자:<input type="text" name="name" value="관리자" /><br> 
			제목:<input type="text" name="title" /><br> 
			카테고리:
				<input type="checkbox" name="cate" value="사진" checked />사진 
				<input type="checkbox" name="cate" value="문서" />문서
				<input type="checkbox" name="cate" value="음악" />음악 
			첨부파일:
				<input type="file" name="attachedFile" /> 
				<input type="submit" value="확인 " />
	</form>

	<script>

	function validationForm(form){
		if(form.name.value)==""{
			alert("작성자를 입력하세요");
			form.name.focus();
			return false;
			
		}
		if(form.name.value)==""{
				alert("제목을 입력하세요");
				form.name.focus();
				return false;
		}
		if(form.name.value)==""{
				alert("첨부파일은 필수입니다요");
				form.name.focus();
				return false;
		}
	}

</script>

</body>
</html>