<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="board.BoardDAO" %>
    <%@ page import="board.BoardDTO" %>
    <%@ page import="utils.AlertFunc" %>
    
    <%
    String title=request.getParameter("title");
    String content=request.getParameter("content");
    
    BoardDTO dto=new BoardDTO();
    dto.setTitle(title);
    dto.setContent(content);
    dto.setId(session.getAttribute("UserId").toString());// id 값을 알기 위해 우리가 로그인 한거당 
    
    BoardDAO dao=new BoardDAO(application);
    int res = dao.insertWrite(dto); // 결과값 받아오기 
    dao.close();
    
    if(res==1){
    	response.sendRedirect("List.jsp");
    }else{
    	AlertFunc.alertBack("글쓰기가 입력되지 않았습니다. ", out);
    }
    
    
    %>
    
    
