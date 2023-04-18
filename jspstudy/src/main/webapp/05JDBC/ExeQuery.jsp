<%@page import="java.security.interfaces.RSAKey"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="common.JDBConnectPool"%>
<!-- 결과 값을 받아줄 resultset 이 들어와야 함.  -->

<!-- 커넥션 풀로 한다면 .  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원목록 조회</h2>
<%

	//JDBConnect jdbc = new JDBConnect();
	JDBConnectPool jdbc = new JDBConnectPool();


	String sql="select id,pw,name,regdate from member";
	Statement stmt = jdbc.con.createStatement();
	stmt.executeQuery(sql);
	ResultSet rs = stmt.executeQuery(sql);
	// 반복문 돌릴때 next 할때마다 boolean 타입으로 결과값을 돌려줌 
	while(rs.next()){
		String id=rs.getString(1); // 컬럼 명을 쓰든 인덱스 쓰든 할수 있다. 
		String pw=rs.getString(2);
		String name=rs.getString("name");
		java.sql.Date regdate = rs.getDate("regdate");
		System.out.println("here"+id+pw+name);
		out.println(String.format("%s %s %s %s",id,pw,name,regdate)+"<br>");
		
		
	}
	jdbc.close();
%>


</body>
</html>