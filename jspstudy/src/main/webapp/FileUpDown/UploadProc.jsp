<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.io.File" %>
<%@ page import="fileUpDown.MyFileDto" %>
<%@ page import="fileUpDown.MyFileDao" %>

<%
String saveDirectory = application.getRealPath("/Storage"); //저장할 디렉터리
System.out.println(saveDirectory);
int maxPostSize = 1024 * 1000; //파일 최대 크기(1MB)
String encoding = "UTF-8"; // 인코딩 방식

try {
   // 1. MultipartRequest 객체 생성
   MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
   // 2. 새로운 파일명 생성
   String fileName = mr.getFilesystemName("attachedFile");
   String ext = fileName.substring(fileName.lastIndexOf("."));
   String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
   String newFileName = now + ext; // 업로드일시.확장자
   // 3. 파일명 변경
   File oldFile = new File(saveDirectory+File.separator+fileName);
   File newFile = new File(saveDirectory+File.separator+newFileName);
   oldFile.renameTo(newFile);
   // 4. 다른 폼값 받기
   String name = mr.getParameter("name");
   String title = mr.getParameter("title");
   String[] cateArray = mr.getParameterValues("cate");
   StringBuffer cateBuf = new StringBuffer();
   if (cateArray == null)
      cateBuf.append("선택없음");
   else {
      for (String s : cateArray)
   cateBuf.append(s + " ");
   }
   // 5. DTO 생성
   MyFileDto dto= new MyFileDto();
   dto.setName(name);
   dto.setTitle(title);
   dto.setCate(cateBuf.toString());
   dto.setOfile(fileName);
   dto.setNfile(newFileName);
   // 6. DAO를 통해 데이터베이스에 반영
   MyFileDao dao = new MyFileDao();
   dao.insertFile(dto);
   dao.close();
   // 7. 파일 목록 jsp로 리디렉션
   response.sendRedirect("FileList.jsp");
} catch (Exception e) {
   e.printStackTrace();
   request.setAttribute("errMsg", "파일 업로드 오류");
   request.getRequestDispatcher("FileUploadMain.jsp").forward(request,response);
}
%>