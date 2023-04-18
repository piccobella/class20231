<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--화면 로그인 위에 단을 만들기  -->
    
    <table border = "1" width="90%">
    
    	<tr>
    	<td align="center">
    	<% if(session.getAttribute("UserId")==null){ %>
    		<a href="../07LoginOutPrac/LoginForm.jsp">로그인</a>
    		<%} else{%>
    		<a href="../07LoginOutPrac/Logout.jsp">로그아웃</a>
    		<% } %>
    		
    		<a href="../08M1board/List.jsp">게시판</a>
    		<a href="../09PagingBoard/List.jsp">게시판(paging)</a>
    		
    	</td>
    	</tr>
    </table>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>