<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 변수선언  4영역에 각각 다른 이름의 스코프를 넣음 -->
<c:set var="scopeVar" value="Page value" scope="page" />
<c:set var="scopeVar" value="Request value" scope="request" />
<c:set var="scopeVar" value="Session value" scope="session" />
<c:set var="scopeVar" value="Application value" scope="application" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core remove</title>
</head>
<body>
	<ul>

		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>

	</ul>
<br>
	<c:remove var="scopeVar" scope="session" />
		<li>scopeVar : ${scopeVar}</li> <!--스코프 영역값만 불러올경우 / 다른값을 불러오고 싶으면 request -->
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>


<br>

	<c:remove var="scopeVar"  />
		<li>scopeVar : ${scopeVar}</li>
		<li>requestScope.scopeVar : ${requestScope.scopeVar}</li>
		<li>sessionScope.scopeVar : ${sessionScope.scopeVar}</li>
		<li>applicationScope.scopeVar : ${applicationScope.scopeVar}</li>





</body>
</html>