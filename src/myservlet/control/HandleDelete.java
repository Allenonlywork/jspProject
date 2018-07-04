package myservlet.control;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

public class HandleDelete extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("GB2312");
		String delete = request.getParameter("delete");
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean= (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getlogname()==null||loginBean.getlogname().length()==0;
			if(b) {
				response.sendRedirect("Login.jsp");
				
			}
			LinkedList<String> car = loginBean.getCar();
			car.remove(delete);
		} catch (Exception e) {
			response.sendRedirect("Login.jsp");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("lookShoppingCar.jsp");
		dispatcher.forward(request, response);
	}
}
