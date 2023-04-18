<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core if</title>
</head>
<body>

	<c:set var="number" value="100" />
	<c:set var="string" value="JSP" />

	<c:if test="${number mod 2 eq 0 }" var="result" scope="request">
		<!-- 만약 101이면 실행이 안됨 왜냐 if절이 아예 실행이 안되서 -->
	${number}는 짝수 입니다.<br>
	</c:if>
	result:${result}
	<br>
	<!-- 위 동작 처리한것을 저장하고 싶으면 var 변수에 scope 저장영역을 지정해주고 불러주면 저장됐다 나옴 -->

	<c:if test="100">
		EL 이 아닌 정수 지정하면 false
		</c:if>

	<!-- if else 대신 쓰는 구문 -->
	<c:if test="${string eq 'Java'}" var="result2">
		문자열은 java 입니다. <br>
		</c:if>
	<c:if test="${not result2 }">
		문자열이 java 가 아닙니다. <br>
		</c:if>
		
	<c:if test="trUe" var="result3">
	대소문자 구분없이 "trUe"인경우 true<br>
	</c:if>		
	
	result:${result3}<br><br>
	
	
	<c:if test="${true}" var="result4">
	EL 양쪽에 공백이 존재 하면 false값이 됨  true<br><br>
	</c:if>		
	
	result:${result4}
	
	
	<c:if test="${string eq 'Java'}" >
		문자열은 java 입니다. <br>
	</c:if>
	
		<c:if test="${string eq 'JSP'}" >
		문자열은 JSP 입니다. <br>
	</c:if>
	
	
	
</body>
</html>