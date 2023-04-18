<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%@page import="membership.MemberDTO" %>
    <%@page import="membership.MemberDAO" %>
    <%
    
    	String userId=request.getParameter("User_id");
    	String userPw=request.getParameter("User_pw");
    	
    	
    	String oracleDriver=application.getInitParameter("OracleDriver");
    	String oracleUrl=application.getInitParameter("OracleUrl");
    	String oracleId=application.getInitParameter("OracleId");
    	String oraclePw=application.getInitParameter("OraclePw");
    	
    	
    	MemberDAO dao= new MemberDAO(oracleDriver,oracleUrl,oracleId,oraclePw); // 4개 값을 가져와야하는데 어디서 가져올까? 
    	MemberDTO memberDTO = dao.getMember(userId, userPw);
    	dao.close();
    
    	if(memberDTO.getId()!=null){
    		session.setAttribute("UserId",memberDTO.getId());
    		session.setAttribute("UserName",memberDTO.getName());
    		session.setAttribute("UserId",memberDTO.getId());// 로그인 폼으로 다시 돌아가기 
    		response.sendRedirect("LoginForm.jsp");//로그인 정상 처리될때 
    	}else{
    		request.setAttribute("loginErrMsg","로그인 오류입니다.");// 리퀘스트에 저장했다는 건 값을 저장했다는 뜻. 
    		request.getRequestDispatcher("LoginForm.jsp").forward(request,response);
    		
    	}
    %>
