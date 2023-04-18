<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="common.Person"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Include page 영역 속성값</h2>
	<%
 	int pInt3=(Integer)(pageContext.getAttribute("pInteger"));
	String pStr3 = pageContext.getAttribute("pString").toString();
	Person pObj3 = (Person)(pageContext.getAttribute("pObject"));
	
%>
	<ul>
		<li>숫자:<%=pInt3 %></li>
		<li>문자열:<%=pStr3 %></li>
		<li>객체:<%=pObj3.getName() %>,<%=pObj3.getAge() %></li>
		
	</ul>
</body>
</html>