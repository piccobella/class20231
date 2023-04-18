package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import m2board.MBoardDAO;
import m2board.MBoardDTO;
import utils.AlertFunc;
import utils.FileUtil;

@WebServlet("/m2board/pass.do")
public class PassController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", req.getParameter("mode"));
		// 넘어온 리퀘스터 그냥 넘기고 싶으면
		req.getRequestDispatcher("/14M2Board/Pass.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 매개변수 저장
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");

		
		//비밀번호 확인 DB 랑 연결해서 뭘 받아 올거냐 
		
		MBoardDAO dao=new MBoardDAO();
		boolean confirmed= dao.confirmPassword(pass,idx);
		dao.close();
		
		// 무엇을 진행할지 삭제 수정 
		if(confirmed) {// 비번이 일치 한 경우 
			if(mode.equals("edit")) {//수정
				HttpSession session =req.getSession();
				session.setAttribute("pass",pass);
				resp.sendRedirect("../m2board/edit.do?idx="+idx);
			}else if(mode.equals("delete")) {//삭제
				dao=new MBoardDAO();
				MBoardDTO dto=dao.getView(idx);// 저장된 파일 받아서 읽어오기 
				int result = dao.deletePost(idx);// 게시물 삭제일어나면 연결했던거 끊어주고 
				dao.close();
				if(result==1) {// 한개 삭제 됐다고 했을때 성공했을때 첨부파일도 삭제 
					String saveFileName=dto.getNfile();
					FileUtil.deleteFile(req,"/Storage",saveFileName);
					
				}
				AlertFunc.alertLocation(resp,"삭제되었습니다.","../m2board/list.do");
			}
		}else {// 비번이 불일치
			AlertFunc.alertBack(resp,"비밀번호 검증이 실패했습니다.");
		}
	}

}
