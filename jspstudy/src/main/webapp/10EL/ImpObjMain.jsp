<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  pageContext.setAttribute("scopeVal","페이지영역"); // 같은 이름이 변수명으로 선택 했을떄 불러오면 가장 작은 영역이 옴 
  request.setAttribute("scopeVal","요청영역");
  session.setAttribute("scopeVal","세션영역");
  application.setAttribute("scopeVal","어플리케이션영역");
  
  
  %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL 내장객체</title>
</head>
<body>
<h2>내장객체 속성 값 출력</h2>
	<ul>
		<li>${ pageScope.scopeVal}</li>
		<li>${ requestScope.scopeVal}</li>
		<li>${ sessionScope.scopeVal}</li>
		<li>${ applicationScope.scopeVal}</li>
		
	<h3> 영역지정없이 속성 값 출력</h3>
	<li>${ scopeVal}</li>
	</ul>

<jsp:forward page="ImpObjForward.jsp"/>
</body>
</html>