<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" 
trimDirectiveWhitespaces="true"%>
<!-- trimDirectivewithespace 는 소스 내 공백 없애기  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시어 page 속성 import</title>
</head>
<body>

<%
	Date today = new Date();
	SimpleDateFormat fm= new SimpleDateFormat("yyyy-MM-dd");
	String todayF= fm.format(today);
	out.println("오늘날짜:" +todayF);
%>

</body>
</html>