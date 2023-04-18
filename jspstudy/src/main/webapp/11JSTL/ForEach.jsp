<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="common.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>For Each 구문</title>
</head>
<body>

	<h4>일반 for문</h4>
	<c:forEach var="i" begin="1" end="3" step="1">
		<!-- 초기값 증감식 -->

		<p>반복 ${i}</p>


	</c:forEach>

	<h4>반복문 속성</h4>

	<table border="1">
		<c:forEach begin="3" end="7" varStatus="loop">
			<tr>
				<td>count:${loop.count}</td><!--반복순서-->
				<td>index:${loop.index}</td><!--?-->
				<td>current:${loop.current}</td><!--현재값-->
				<td>first:${loop.first}</td><!--처음인지 여부-->
				<td>last:${loop.last}</td><!--마지막인지 여부 -->
				<td>i:${i}</td>
			</tr>

		</c:forEach>
	</table>

for(초기화; 조건식; 증감식


<h4>enhanced for문</h4>

<%
 String[] rainbow={"빨","주","노","초","파","남","보"};
%>
	<c:forEach items="<%=rainbow %>" var="color"> 
	<!-- 어디에 저장할지 변수를 설정 해주고 foreach문에서 반복 가능한 것을 받아오기 위해  items 를 씀-->

		<span>${color}</span>
	</c:forEach>





<%
 String[] rainbow2={"red","orange","yellow","green","blue","navy","purple"};
%>

	<h4>반복문 속성</h4>

	<table border="1">
		<c:forEach items="<%=rainbow2%>" var="color" varStatus="loop">
			<tr>
				<td>count:${loop.count}</td><!--반복순서-->
				<td>index:${loop.index}</td><!--인덱스 -->
				<td>current:${loop.current}</td><!--인덱스의 실제 요소값-->
				<td>first:${loop.first}</td><!--처음인지 여부-->
				<td>last:${loop.last}</td><!--마지막인지 여부 -->
				<td style="color:${color};">color:${color}</td>
			</tr>

		</c:forEach>
	</table>

</body>
</html>