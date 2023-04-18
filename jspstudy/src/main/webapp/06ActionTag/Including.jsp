<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String incP1="./out/IncludePage1.jsp";
    	String incP2="./out/IncludePage2.jsp";
    	
    	pageContext.setAttribute("pageAttr","페이지 속성");
    	request.setAttribute("reqAttr","요청 속성");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Include</title>
</head>
<body>
<h2>지시어 directive include</h2>
<%@ include file="./out/IncludePage1.jsp" %>
<%--@ include file="<%=incP1 지시어 내부 표현식을 포함 할수 없다. --%> 
<p>외부파일 변수: <%=var1%> </p>
<!-- 페이지 안에 있기 때문에 바로 적을 있다.  -->



<h2>액션 태그 action tag</h2>
<jsp:include page="./out/IncludePage2.jsp"/>
<jsp:include page="<%=incP2 %>"/>
<p>외부파일 변수: <%--=var2--%> </p>
<!--  액션 태그는 이렇게 표현식을 넣어줄수 있다 값으로
결과만 포함 되니까. 변수도 별개고 그래서 쓸수 없다.   -->

</body>
</html>