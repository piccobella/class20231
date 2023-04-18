<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.sql.PreparedStatement"%> 
 <%@ page import="java.sql.Connection"%> 
 <%@ page import="common.JDBConnect"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가 수정 삭제</title>
</head>
<body>
<h2>회원추가</h2>
<%

	JDBConnect jdbc= new JDBConnect();
	
	String id= "test1";
	String pw= "9999";
	String name= "시험대상1";


	String sql="insert into member values(?,?,?,sysdate)";// 누군가 값을 넣어 줘야 할때 다음 preparestatement 쓴다 .
	PreparedStatement psmt=jdbc.con.prepareStatement(sql);// con은 연결/ 하다 / prepare은 sql 문 넣기 아래 뒤에 값을 수정할 수 있다. 
	psmt.setString(1,id);
	psmt.setString(2,pw);
	psmt.setString(3,name);
	//setInt(index,value)/setDate(index,value)/setString(index,value)
	
	
	// 실행 시키기 
	int res= psmt.executeUpdate(); // 몇개 행이 나오는지 int 값으로 나옴 
	out.println(res+"행 입력");
	jdbc.close();

%>
</body>
</html>