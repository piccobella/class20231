<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board.BoardDTO"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%

	BoardDAO dao = new BoardDAO(application); // 기본 생성자 없으니 application만들어 져있는거 쓰기 
	
	String findCol=request.getParameter("findCol"); // 검색해서 넘어온 값은 어케 받아? request.parameter로 받기 
	String findWord=request.getParameter("findWord"); // 불러오는건 아래 네임값에 불러오는것 
	Map<String,Object>param = new HashMap<String,Object>();// 맵에다 집어 넣어서 한번에 하려함
	if(findWord!=null){
		param.put("findCol",findCol);
		param.put("findWord",findWord);
		
	}
	int totalCount= dao.getTotalCount(param); // 계시물 개수도 불러올 객체 만들기 
	List<BoardDTO> boardLists=dao.getList(param); // 나중에 수정할때 매개 변수 늘어나거나 하면 여기 하고 쿼리 수정하고 힘드니 한개로 다 몰아 넣고 

	dao.close();


%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:include page="../common/Top.jsp" />
	<h2>목록 보기</h2>
	<!-- 검색 -->
	<form method="get">
		<!-- 검색 눌렀을 때 해야할 페이지 이동은 자리로 돌아 오니까. action="#"을쓰던지 지우던지   -->

		<table border="1" width="90%">
			<tr>
				<td align='center'>
				<select name="findCol">
						<option value="title">제목</option>
						<option value="content">내용</option>
				</select>
				 <input type="text" name="findWord" /> 
				 <input type="submit"value="검색" />
				 </td>
			</tr>
		</table>


	</form>
	<!-- 목록 -->
	<table border="1" width="90%">
		<tr>

			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>

		</tr>
		<%
			if(boardLists.isEmpty()){// 게시물이 없는 경우
		
		%>
		<tr>
			<td colspan align="center">등록된 계시물이 없습니다.</td>
		</tr>


		<%
			}else{// 게시물이 있는경우  반복문 해서 여러개로 찍어주기 
				for(BoardDTO dto:boardLists){
			
		%>

		<tr align="center">
			<td align="center"><%=dto.getNum() %></td>
			<td align="left">
			<a href="View.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a>    </td>
			
			
			
			<td align="center"><%=dto.getId() %></td>
			<td align="center"><%=dto.getVisitcount() %></td>
			<td align="center"><%=dto.getPostdate() %></td>

		</tr>

	<%  
		
			}
		}
	%>
	</table>
	<br>
	<div align="center">
		<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>  <!--자바 페이지 이동 location-->
		<!-- 자바 스크립트 연동하는 3가지 방법
		< on>
		<script src=>
		  -->
</body>
</html>