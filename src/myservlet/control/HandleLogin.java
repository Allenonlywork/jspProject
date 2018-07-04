package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.http.*;



import mybean.data.*;


public class HandleLogin extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public String handleString(String s) {
		try {
			byte bb[] = s.getBytes("iso-8859-1");
			s = new String(bb);
		} catch (Exception ee) {
			// TODO: handle exception
		}
		return s;
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = "jdbc:mysql://localhost/shop?&user=root&password=123456&serverTimezone=UTC";
		Connection con;
		Statement sql;
//		Login loginBean = new Login();
//		request.setAttribute("loginBean", loginBean);
		String logname = request.getParameter("logname").trim();
		String password = request.getParameter("password").trim();

		logname = handleString(logname);
		password = handleString(password);

		boolean boo = (logname.length() > 0 && (password.length() > 0));
		try {
			con = DriverManager.getConnection(uri);
			String condition = "select * from user where logname = '" + logname + "' and password = '" + password
					+ "'";
			sql = con.createStatement();

			if (boo) {
				ResultSet rs = sql.executeQuery(condition);
				boolean m = rs.next();
				if (m) {
					// 调用登录成功的方法
					success(request, response, logname, password);
					RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");// 转发
					dispatcher.forward(request, response);
				} else {
					String backNews = "您输入的用户名不存在，或密码不匹配";
					// 调用登录失败的方法
					fail(request, response, logname, backNews);
				}
			} else {
				String backNews = "请输入用户名和密码";
				fail(request, response, logname, backNews);
			}
			con.close();
		} catch (SQLException exp) {
			String backNews = "" + exp;
			fail(request, response, logname, backNews);
		}

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
		
	public void success(HttpServletRequest request,HttpServletResponse response,String logname,String password) throws IOException {
		
		Login loginBean = null;
		HttpSession session =request.getSession(true);
		try {
			loginBean = (Login)session.getAttribute("loginBean");
			if(loginBean == null) {
				loginBean = new Login();
				session.setAttribute("loginBean", loginBean);
				loginBean = (Login)session.getAttribute("loginBean");
				
			}
			String name = loginBean.getlogname();
			if(name.equals(logname)) {
				loginBean.setBackNews(logname + "已经登录了");
				loginBean.setlogname(logname);
			}else {
				loginBean.setBackNews(logname + "登录成功");
				loginBean.setlogname(logname);
				
			}
		}catch (Exception e) {

			loginBean = new Login();
			session.setAttribute("loginBean", loginBean);
			loginBean.setBackNews(logname + "登录成功");
			loginBean.setlogname(logname);
			
		}
	}	
	
	public void fail(HttpServletRequest request,HttpServletResponse response,String logname,String backNews) {
		response.setContentType("text/html;charset=gb2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + logname + "登录反馈结果<br>" + backNews + "</h2>");
			out.println("返回登录页面或主页<br>");
			out.println("<a href=Login.jsp>登录页面</a>");
			out.println("<br><a href = index.jsp>主页</a>");
			out.println("</body></html>");
			
		} catch (IOException e) {
			// TODO: handle exception
		}
	}
		
		
}
