<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:set var="iTag">
	 	i 태그는 <i>기울임</i>을 표현합니다.
	 	</c:set>
	 	<h4>기본사용</h4>
	 	<c:out value="${iTag}"/>
	 	${iTag}
	 		<h4>escapeXml 속성</h4>
	 		<c:out value="${iTag }" escapeXml="false"/>
	 		<c:out value="${param.name }" default="이름없음"/>
	 		<c:out value="" default="반문자열도 값으로 처리 비어있는 값으로 봄 "/> <!-- 빈값일때 따로 뭔갈 하고 싶다.  -->
	 		
</body>
</html>