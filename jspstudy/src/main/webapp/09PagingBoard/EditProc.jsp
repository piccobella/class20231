<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="utils.AlertFunc"%>

<%
    String num=request.getParameter("num");
    String title=request.getParameter("title");
    String content=request.getParameter("content");
    
    BoardDTO dto=new BoardDTO();
    dto.setNum(num);// 어떤 게시물인지 찾고 
    dto.setTitle(title);
    dto.setContent(content);
    //채크 필요 없음. dto.setId(session.getAttribute("UserId").toString());// id 값을 알기 위해 우리가 로그인 한거당 
    
    BoardDAO dao=new BoardDAO(application);
    int res = dao.updateEdit(dto); // 결과값 받아오기 
    dao.close();
    
    if(res==1){
    	response.sendRedirect("View.jsp?num="+dto.getNum());
    }else{
    	AlertFunc.alertBack("수정하지 못했습니다. ", out);
    }
    
    
    %>


