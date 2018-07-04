package myservlet.control;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class HandleExit extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		session.invalidate();  			//�����û���session����
		response.sendRedirect("index.jsp"); 	//������ҳ
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		doPost(request, response);
	}
}