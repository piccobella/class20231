<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Formatting</title>
</head>
<body>
	<h4>국제화 태그</h4>
	<c:set var="number1" value="12345" />
	콤마포함:
	<fmt:formatNumber value="${number1}" />
	<br> 콤마미포함:
	<fmt:formatNumber value="${number1}" groupingUsed="false" />
	<br>
	<h4>숫자포멧</h4>
	<fmt:formatNumber value="${number1 }" type="currency"
		currencySymbol="$" var="print1"></fmt:formatNumber>
	통화기호: ${print1 }
	<br>
	<fmt:formatNumber value="0.03" type="percent" var="print2" scope="page"></fmt:formatNumber>
	퍼센트 :${print2 }
	<br>
	<fmt:formatNumber value="1234556436.234" pattern="#,#00.00" />

	<!--  소수점 아래 몇자리까지 표현 하겠다. 0,000.00 이렇게도 가능 -->



	<c:set var="today" value="<%=new java.util.Date()%>" />
	${today}
	<h2>날짜 포멧</h2>
	full:
	<fmt:formatDate value="${today}" type="date" dateStyle="full" />
	<br> short:
	<fmt:formatDate value="${today}" type="date" dateStyle="short" />
	<br> long:
	<fmt:formatDate value="${today}" type="date" dateStyle="long" />
	<br> default:
	<fmt:formatDate value="${today}" type="date" dateStyle="default" />
	<br>


	<h2>시간 포멧</h2>
	full:
	<fmt:formatDate value="${today}" type="time" timeStyle="full" />
	<br> short:
	<fmt:formatDate value="${today}" type="time" timeStyle="short" />
	<br> long:
	<fmt:formatDate value="${today}" type="time" timeStyle="long" />
	<br> default:
	<fmt:formatDate value="${today}" type="time" timeStyle="default" />
	<br>


	<h2>날짜 시간 포멧</h2>

	<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full" />
	<br>
	<fmt:formatDate value="${today}" type="both" dateStyle="short"  timeStyle="short" />
	<br>
	<fmt:formatDate value="${today}" type="both" dateStyle="long" timeStyle="long" />
	<br>
	<fmt:formatDate value="${today}" type="both" dateStyle="default" timeStyle="default" />
	<br><br><br>
	
	<h4>내가 설정하기</h4>
	<fmt:formatDate value="${today}" type="both" pattern="yyyy-mm-dd hh:mm:ss" />
	<br>
	
	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	
	
		<h4>타임존 설정</h4>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/>
	</fmt:timeZone>
	
	<h4>로컬 설정</h4>
	한글:<fmt:setLocale value="ko_kr"/>
		<fmt:formatNumber value="10000" type="currency" />/
		<fmt:formatDate value="${today}"/><br>
		
	일어:<fmt:setLocale value="ja_JP"/>
		<fmt:formatNumber value="10000" type="currency" />/
		<fmt:formatDate value="${today}"/><br>
		
	영어:<fmt:setLocale value="en_US"/>
		<fmt:formatNumber value="10000" type="currency" />/
		<fmt:formatDate value="${today}"/><br>
		

	<!-- 
	
		parseDate:formatDate 반대개념 
		requestEncoding:인코딩 타입을 정의 
		bundle,message: 전달되는 메세지 처리는 맞지만 다국어 처리할때 좋다. 
	
	
	-->
	
	
	
</body>
</html>