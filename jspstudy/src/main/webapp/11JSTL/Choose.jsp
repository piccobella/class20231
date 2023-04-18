<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core choose/ when/otherwise</title>
</head>
<body>
	<c:set var="num" value="99" />

	<h4>choose</h4>
	<c:choose>
		<c:when test="${num mod 2 eq 0 }">
		${num} 는 짝수입니다. 
	</c:when>

		<c:otherwise>
	${num}는 홀수 입니다. 
	</c:otherwise>
	</c:choose>



	<h4>영어,수학,과학 점수 입력 받아서 평균을 구하고 학점 출력</h4>

	<!-- 입력 받기 form 값에 아무것도 입력 안하면 자기 자신한태 돌아옴 -->
	<form>
		영어: <input type="number" name="eng" min="0" max="100" value="${param.eng}"/><br> <!-- value에 넣으면 해당값 저장  -->
		수학: <input type="number" name="math" min="0" max="100" /><br>  <!-- text 말고 number 타입으로 하면 숫자만 들어감  -->
		과학: <input type="number" name="sci" min="0" max="100"/><br>
		<input type="submit" value="학점구하기" /><br>
	</form>

	<!-- 학점은 90점 이상 수, 80점이상 우, 70점 이상 미,60점이상 양, 나머지 가-->
	<!-- 평균점수:?? /학점 :??, -->
	<!-- 평균 구하려면 값을 넣기 
		3 값을 더하기 
	
		-->
	<!-- EL -->
		국어 :${param.eng}점
	<br>수학 :${param.math}점
	<br>과학 :${param.sci}점
	<br>
	<!-- 유효성 체크  -->
	<c:if test="${not (empty param.eng or empty param.math or empty param.sci)}"/> <!--  해당값이 비어있지 않으면 실행 -->
	<!--  avg에 값을 할당해놓음  -->
	<c:set var="avg" value="${(param.eng+param.math+param.sci)/3 }"></c:set>
	<!--  avg에 값구하기  -->
	평균점수 : ${avg}/학점 :
	
		<c:choose> 
			<c:when test="${avg >= 90}">수  </c:when>
			<c:when test="${avg >= 80}">우  </c:when>
			<c:when test="${avg >= 70}">미  </c:when>
			<c:when test="${avg >= 60}">양  </c:when>
			<c:otherwise>가</c:otherwise>
		</c:choose> 
	

<!--
		영어: 
		<c:if test="${param.eng>=90 }">수</c:if>
		<c:if test="${param.eng>=80 and param.eng<=89  }">우</c:if>
		<c:if test="${param.eng>=70 and param.eng<=79  }">미</c:if>
		<c:if test="${param.eng>=60 and param.eng<=69  }">양</c:if>
		<c:if test="${param.eng<60 }">가</c:if> -->
		<!--
		<c:if test="${avg ge 90}">수  </c:if>-->
		
		
		
		
		<!-- 
		수학: 
		
		<c:if test="${param.math>=90}">수</c:if>
		<c:if test="${param.math>=80 and param.math<=89}">우</c:if>
		<c:if test="${param.math>=70 and param.math<=79}">미</c:if>
		<c:if test="${param.math>=60 and param.math<=69}">양</c:if>
		<c:if test="${param.math<60 }">가</c:if>
		
		과학:
		<c:if test="${param.sci>=90 }">수</c:if>
		<c:if test="${param.sci>=80 and param.sci<=89}">우</c:if>
		<c:if test="${param.sci>=70 and param.sci<=79 }">미</c:if>
		<c:if test="${param.sci>=60 and param.sci<=69}">양</c:if>
		<c:if test="${param.sci<60 }">가</c:if>
		
		<br><br>
		
		 -->
	
		
		
		
</body>
</html>