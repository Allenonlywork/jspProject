package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.LinkedList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.startup.FailedContext;

import com.sun.net.httpserver.Authenticator.Success;

import mybean.data.Login;

public class HandleBuyGoods extends HttpServlet {
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {}
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		String buyGoodsMess = request.getParameter("buy");
		if(buyGoodsMess==null||buyGoodsMess.length()==0) {
			fail(request,response,"购物车没有物品，无法生成订单");
			return;
		}
		String price = request.getParameter("price");
		if(price==null||price.length()==0) {
			fail(request,response,"购物车没有物品，无法生成订单");
			return;
		}
		float sum = Float.parseFloat(price);
		Login loginBean = null;
		HttpSession session = request.getSession(true);
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			boolean b = loginBean.getlogname()==null||loginBean.getlogname().length()==0;
			if(b) {
				response.sendRedirect("Login.jsp");
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			response.sendRedirect("Login.jsp");
		}
		String uri ="jdbc:mysql://localhost/shop?user=root&password=123456&serverTimezone=UTC";
		Connection con;
		PreparedStatement sql;
		try {
			con = DriverManager.getConnection(uri);
			String insertCondition = "insert into orderform values (?,?,?,?)";
			sql = con.prepareStatement(insertCondition);
			
			sql.setInt(1, 0);
			sql.setString(2, loginBean.getlogname());
			sql.setString(3, buyGoodsMess);
			sql.setFloat(4, sum);
			sql.executeUpdate();
			
			LinkedList car = loginBean.getCar();
			car.clear();
			success(request,response,"生成订单成功");
			
		}catch (Exception e) {
			fail(request,response,"生成订单失败" + e);		}
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		doPost(request, response);
	}
	public void success(HttpServletRequest request,HttpServletResponse response,String backNews) {
		response.setCharacterEncoding("GB2312");
		
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + backNews + "</h2>");
			out.println("返回主页");
			out.println("<a href = 'index.jsp'>主页</a>");
			out.println("<br>查看订单");
			out.println("<a href = 'lookOrderForm.jsp>查看订单</a>");
			out.println("</body></html>");
		} catch (IOException e) {
			// TODO: handle exception
		}
		
	}
	public void fail(HttpServletRequest request,HttpServletResponse response,String backNews) {
		response.setCharacterEncoding("GB2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + backNews + "</h2>");
			out.println("返回主页");
			out.println("<a href = 'index.jsp'>主页</a>");

			out.println("</body></html>");
		} catch (IOException e) {
			// TODO: handle exception
		}
	}
}
