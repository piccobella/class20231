<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="common.Person"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>page 이동</title>
</head>
<body>

	<h2>이동 후 page 영역</h2>

	<%--
	int pInt3=(Integer)(pageContext.getAttribute("pInteger"));
	String pStr3 = pageContext.getAttribute("pString").toString();
	Person pObj3 = (Person)(pageContext.getAttribute("pObject"));
	
	널값이라 해결하려면 
	--%>

	<%
	Object pInt3=pageContext.getAttribute("pInteger");
	Object pStr3 = pageContext.getAttribute("pString");
	Object pObj3 = pageContext.getAttribute("pObject");
	
	
	%>


	<ul>
		<li>숫자:<%=(pInt3==null)?"값이 없음":pInt3 %></li>
		<li>문자열:<%=(pStr3==null)?"값이 없음":pStr3 %></li>
		<li>객체:<%=(pObj3==null)?"값이 없음":pObj3 %></li>

	</ul>
	
	
	
</body>
</html>