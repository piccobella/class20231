<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<jsp:include page="../common/Top.jsp"></jsp:include>
	<h2>로그인 페이지</h2>
	<span style="color:red;font-size:1.2em; ">
	<%=request.getAttribute("loginErrMsg")==null?" ":request.getAttribute("loginErrMsg") %>
    </span>
    <% if(session.getAttribute("UserId")==null){ // 로그인 상태 확인 
    	// 로그아웃 상태 %>
    	<form action="LoginProcess.jsp" method="post" name="loginForm">
    	
    	아이디:<input type="text" name="User_id"required/><br>
    	   	
    	패스워드:<input type="password" name="User_pw" required="required"/><br>
    	
    	<input type="submit" value="로그인"/>
    	</form>
     	
     	
     <% }else{// 로그인 된 상태  %>	
     <%=session.getAttribute("UserName") %>회원님, 오셨쎄염? <br>
     <a href="Logout.jsp">[로그아웃]</a>
    
     <% }%> 
    
    	
    	
    	
    	
   
</body>
</html>