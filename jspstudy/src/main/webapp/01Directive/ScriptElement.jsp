<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!// 선언부 (변수,메서드)
public int add(int num1,int num2){
	return num1+num2;}
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Script Elements 스크립트</title>
</head>
<body>

<% // scriptlet 스크립틀릿(javacode) 

	int result = add(10,30);
	%>
	<p>덧셈1: <%=result %></p> <!--  등호를 써서 사용하는 방식 = 스크립트 요소 표현식 -->
	<p>덧셈2: <%=add(20,50) %></p>
	
	<font size='9'>
	<!--  html 주석 --><br>
	<%-- jsp 주석  --%><br>
	comment <br>
	</font>

</body>
</html>