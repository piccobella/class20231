<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="common.JDBConnect"%>
<%@page import="common.JDBConnectPool"%>
<!-- 자바 클래스 파일을 가져옴  -->


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>JDBC CONNECT TEST</h2>
	<%
	JDBConnect jdbc1= new JDBConnect();
	jdbc1.close();

%>

<!-- 직접 클라이언트 단에서 구현하는거  -->
	<h2>JDBC connect test2</h2>
	<%
			String driver="oracle.jdbc.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "jin";
			String pw = "1234";
			JDBConnect jdbc2= new JDBConnect(driver,url,id,pw);
			jdbc2.close();
		%>


	<h2>JDBC connect test3</h2>

	<%

JDBConnect jdbc3= new JDBConnect(application);
jdbc3.close();

%>

<!-- 클래스 파일 임포트 해서 서버단에서 실행하는것  -->
	<h2>JDBC Connection Pool test</h2>
<%
JDBConnectPool pool = new JDBConnectPool();
	pool.close();
%>


</body>
</html>