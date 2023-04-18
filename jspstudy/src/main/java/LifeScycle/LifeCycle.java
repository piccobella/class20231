package LifeScycle;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//연동시키기 아님 web.xml 에다가 하기 
@WebServlet("/LifeCycle.do")
public class LifeCycle extends HttpServlet {

	@PostConstruct
	public void mPostConstruct() {
		System.out.println("PostConstruct call");

	}

	@Override
	public void init() throws ServletException {
		System.out.println("init() call");

	}

//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("Service() call");
//	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() call");
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() call");
	}

	@Override
	public void destroy() {
		System.out.println("destroy() call");
	}

	@PreDestroy
	public void mPreDestroy() {
		System.out.println("mPretDestroy() call");
	}

}
