<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="./include/FruitLIst.xml" var="fruitlist"
		charEncoding="UTF-8" />
	${fruitlist}
	<x:parse xml="${fruitlist}" var="flist" />
	<br>
	<x:out select="$flist/fruitlist/fruit[2]/name" />
	<br>
	<x:out select="$flist/fruitlist/fruit[2]/from" />
	<br>
	<x:out select="$flist/fruitlist/fruit[2]/price" />
	<br>

	<table border="1">
		<tr>
			<th>이름</th>
			<th>원산지</th>
			<th>가격</th>
		</tr>
		<x:forEach select="$flist/fruitlist/fruit" var="fruit">
			<tr>
				<td><x:out select="$fruit/name" /></td>
				<td><x:out select="$fruit/from" /></td>
				<td><x:out select="$fruit/price" /></td>

			</tr>
		</x:forEach>

	</table>
</body>
</html>