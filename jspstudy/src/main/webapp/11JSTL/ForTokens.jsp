<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core forTokens</title>
</head>
<body>
	<!--String Tokenizer class
	구분자를 기준으로 스트링을 토큰으로 자름 
	그게 JSTL 에서 나온거임
	-->


	<%
 String rainbow2="red,orange,yellow,green,blue,navy,purple";
%>
	<c:forTokens items="<%=rainbow2 %>" delims="," var="color">
		<span style="color:${color}">${color}</span>
	</c:forTokens>



</body>
</html>