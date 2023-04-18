<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="common.Person"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>request 영역 forward</title>
</head>
<body>

<h2>forward request area</h2>
<%

	request.setCharacterEncoding("UTF-8"); // 아래 한글 때문에 캐릭터 인코딩 넣어줌 
	Person rObj =(Person)(request.getAttribute("rObject"));


%>
	<ul>
      <li>문자열: <%=request.getAttribute("rString") %></li>
      <li>객체: <%=rObj.getName() %>,<%=rObj.getAge() %></li>
      <li><%=request.getParameter("com") %></li>
      <li><%=request.getParameter("fill") %></li>
   </ul>

<%
	ArrayList<String> lists = (ArrayList<String>)session.getAttribute("lists");
	for(String item:lists){
		 out.print(item+"<br>");
	}


%>
</body>
</html>