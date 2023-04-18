package m2board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import utils.AlertFunc;
import utils.FileUtil;
@WebServlet("/m2board/edit.do")

public class EditController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx=req.getParameter("idx");// 기존 값에다가 수정 해서 같이 보내주니까. 필요함
		MBoardDAO dao=new MBoardDAO();
		MBoardDTO dto=dao.getView(idx); // 기존데이터 뽑아서 수정 
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14M2Board/Edit.jsp").forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//파일 업로드 처리
				//>업로드 디렉토리의 물리적 경로 확인
				String saveDirectory=req.getServletContext().getRealPath("/Storage");
				//>파일 업로드를 위한 기본 정보
				ServletContext application= getServletContext();
				int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
				//>파일 업로드
				MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
				if(mr==null) {
					//파일 업로드 실패하면
					AlertFunc.alertBack(resp, "파일이 업로드 되지 않았습니다. ");
					return;
				}
				//DB 정보 저장
				String idx=mr.getParameter("idx");
				String preOfile=mr.getParameter("prevOfile");
				String preNfile=mr.getParameter("prevNfile");
				
				// 비번 받아오겟다 하면 
				HttpSession session=req.getSession();
				String pass=(String)session.getAttribute("pass");
				
				
				//폼값을 DTO 저장
				MBoardDTO dto=new MBoardDTO();
				dto.setIdx(idx);
				dto.setName(mr.getParameter("name"));
				dto.setTitle(mr.getParameter("title"));
				dto.setContent(mr.getParameter("content"));
				dto.setPass(pass);
				//원본 파일명과 수정된 파일명 
				String filename=mr.getFilesystemName("ofile");
				if(filename!=null) {
					//새 파일 명 생성
					String nfname=new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
					String ext=filename.substring(filename.lastIndexOf("."));
					String newFileName=nfname+ext;
					//파일명 변경
					File oldFile=new File(saveDirectory+File.separator+filename);
					File newFile=new File(saveDirectory+File.separator+newFileName);
					oldFile.renameTo(newFile);
					dto.setOfile(filename);//원래 파일 이름
					dto.setNfile(newFileName);//서버에 저장된 파일 이름			
					System.out.println(dto.getPass());
					//기존파일 삭제
					FileUtil.deleteFile(req,"/Storage",preNfile);
				}else {
					dto.setOfile(preOfile);
					dto.setNfile(preNfile);
				
				}
				//DAO를 통해 DB에 내용 저장
				MBoardDAO dao = new MBoardDAO();
				int result=dao.updatePost(dto);
				dao.close();
				//성공여부
				if(result==1) {//성공
					session.removeAttribute("pass");
					resp.sendRedirect("../m2board/view.do?idx="+idx);
				}else {
					AlertFunc.alertLocation(resp, "수정이 되지 않았습니다. ","../m2board/list.do");
				}
				
		
		
}
}