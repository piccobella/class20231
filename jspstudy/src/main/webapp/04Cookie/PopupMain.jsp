<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String popupMode = "on";
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			String cName = c.getName();
			if (cName.equals("popupMode")) {
		popupMode = c.getValue();
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창 관리</title>
<style>
#popup {
	position: absolute;
	top: 100px;
	left: 50px;
	color: yellow;
	width: 270px;
	height: 100px;
	background-color: gray;
}

#popup>div {
	position: relative;
	background-color: white;
	top: 0px;
	border: 1px solid gray;
	padding: 10px;
	color: black;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
	$(function(){
	    $("#closeBtn").click(function(){
	           $("#popup").hide();
	           //쿠키 설정 하는데 체크 했을때 그걸 inactiveToday 체크를 해야함. 그 값을 위해 1을 줬기 때문에 그 값을 받아와야함. 
	           var chk=$('inactiveToday:checked').val(); // 가상 :checked 를 넣어줌
	    		if(chk=='1'){
	    			$.ajax({
	    				url:'./PopupCookie.jsp',
	    				type:'get',
	    				data:{inactive:chk}, // 자바스크립트 객체 형태로 받아줌 
	    				datatype:'text',
	    				success: function(resData){// 하루동안 안열기가 resdata로 넘어옴
	    					if(resData!=''){
	    						console.log(resData);
	    						location.reload();
	    					}
	    				} 
	    			})
	    			
	    		}   
	    
	    });
	});

		
</script>

</head>
<body>

	<h2>팝업 메인 페이지</h2>

	<%
	if(popupMode.equals("on")){
	%>
	<div id="popup">
		<h2 align="center">공지사항</h2>
		<div align="right">
			<form name="popfrom">
				<input type="checkbox" id="inactiveToday" value="1" /> 하루동안 안열기 <input
					type="button" id="closeBtn" value="닫기" />
			</form>

		</div>

	</div>
<% 
}
	%>
</body>
</html>