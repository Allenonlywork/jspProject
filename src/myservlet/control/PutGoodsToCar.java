package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybean.data.Login;

public class PutGoodsToCar extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		String goods = request.getParameter("java");
		System.out.println(goods);
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getlogname() ==null||loginBean.getlogname().length()==0;
			if(b) {
				response.sendRedirect("Login.jsp"); //重定向到登录页面
			}
			LinkedList<String> car = loginBean.getCar();
			car.add(goods);
			speakSomeMess(request,response,goods);
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("Login.jsp");
		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		doPost(request, response);
	}
	public void speakSomeMess(HttpServletRequest request,HttpServletResponse response, String goods) {
		response.setContentType("text/html;charset=GB2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body><HEAD><%@ include file = \"head.txt\" %></HEAD>");
			out.println("<h2>" + goods + "放入购物车</h2>");
			out.println("查看购物车或返回浏览化妆品<br/>");
			out.println("<a href = 'lookShoppingCar.jsp'>查看购物车</a>");
			out.println("<br><a href = 'byPageShow.jsp'>浏览化妆品</a>");
			out.println("</body></html>");
		}catch (IOException exp) {
			// TODO: handle exception
		}
		
	}
}
