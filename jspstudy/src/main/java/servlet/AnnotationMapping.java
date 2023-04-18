package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AnnotationMapping.abcd")
public class AnnotationMapping extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws ServletException,IOException{;
	req.setAttribute("message","annotationmapping");
	req.getRequestDispatcher("/13Servlet/AnnotationMapping.jsp")
		.forward(req, resp);
	}
}
