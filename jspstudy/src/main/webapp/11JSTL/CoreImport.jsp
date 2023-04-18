<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core import</title>
</head>
<body>
   <c:set var="reqVar" value="park"/>
   <c:import url="./include/OtherPage.jsp" var="contents">
      <c:param name="param1" value="JSP" />
      <c:param name="param2" value="JAVA" />
   </c:import>
   <h4>다른 문서 삽입하기</h4>
   ${contents}
   <c:import url="./include/OtherPage.jsp">
      <c:param name="param1" value="ultra" />
      <c:param name="param2" value="super" />
   </c:import>
	<c:import url="./include/OuterPage.jsp"></c:import>
</body>
</html>
	


