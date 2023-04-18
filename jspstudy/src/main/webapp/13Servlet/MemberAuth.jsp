<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버인증</title>
</head>
<body>
<h2>MVC 패턴 -> 회원인증</h2>
<ol>

<li>${authMsg}</li>
<li><a href="./MemberAuth.mvc?id=admin&pass=1234">회원인증(admin)</a>
<li><a href="./MemberAuth.mvc?id=HYUN&pass=1234">회원인증(member)</a>
<li><a href="./MemberAuth.mvc?id=test1&pass=9999">회원인증(비회원)</a>
</ol>

<form name="authFrm" method ="post" action="./MemberAuth.mvc">
<input type="text" name="id" placeholder="아이디"/>
<input type="text" name="pass" placeholder="비밀번호"/>
<input type="submit" value="인증 "/>


</form>

</body>
</html>