<%@page import="utils.AlertFunc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<%
String saveDirectory = application.getRealPath("/Storage");
String saveFilename = request.getParameter("nName").trim();
String originFilename = request.getParameter("oName").trim();
// 저장된 파일 불러오기 
try {
	//파일 찾아서 입력 스트림 생성
	//파일도 가져와야 하고 파일 객체로 먼저 만들고 해당 파일이 savedirectory 
	File file = new File(saveDirectory, saveFilename);
	InputStream inStream = new FileInputStream(file);

	// 한글 파일명 깨짐 방지 
	String client = request.getHeader("User-Agent");
	if (client.indexOf("WOW64") == -1) {

		originFilename = new String(originFilename.getBytes("UTF-8"), "ISO-8859-1");
	} else {
		originFilename = new String(originFilename.getBytes("KSC5601"), "ISO-8859-1");

	}
	// 파일 다운로드 응답 헤더 설정
	response.reset();
	response.setContentType("application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename=\"" + originFilename + "\"");
	response.setHeader("Content-Length", "" + file.length());
	// 출력 스트림 초기화

	out.clear();
	out = pageContext.pushBody();
	//response 내장 객체로 새로운 출력 스트림 생성 
	OutputStream outStream = response.getOutputStream();
	byte b[] = new byte[(int) file.length()];
	int readBuffer = 0;
	while ((readBuffer = inStream.read(b)) > 0) {
		outStream.write(b, 0, readBuffer);
	}
	// 입출력 스트림 닫기 
	inStream.close();
	outStream.close();
} catch (FileNotFoundException e) {
	e.printStackTrace();
	// 파일 못찾으면 alert 창띄우고 돌아가게 하기
	AlertFunc.alertBack("파일을 찾을 수 없습니다. ", out);

} catch (Exception e) {
	e.printStackTrace();
	AlertFunc.alertBack("예외가 발생했습니다. . ", out);
}
%>