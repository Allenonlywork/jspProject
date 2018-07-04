package myservlet.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;
import com.sun.rowset.CachedRowSetImpl;

import mybean.data.DataBypage;

public class SearchByCondition extends HttpServlet {
	CachedRowSetImpl rowSet = null;
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");

		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("GB2312");
		String searchMess = request.getParameter("searchMess");
		String radioMess = request.getParameter("radio");
		if(searchMess == null||searchMess.length()==0) {
			fail(request,response,"没有查询信息，无法查询");
			return;
		}
		String condition = "";
		if(radioMess.equals("cosmetic_number")) {
			condition = "seclect * from cosmeticForm where cosmetic_number = '" + 
		searchMess + "'"; 
		}
		if(radioMess.equals("cosmetic_name")) {
			condition = "seclect * from cosmeticForm where cosmetic_name like '%" + 
		searchMess + "%'"; 
		}else if (radioMess.equals("cosmetic_price")) {
			double max = 0,min=0;
			String regex = "[^0123456789.]";
			String [] priceMess = searchMess.split(regex);
			if(priceMess.length==1) {
				max = min = Double.parseDouble(priceMess[0]);
			}else if (priceMess.length == 2) {
				min = Double.parseDouble(priceMess[0]);
				max = Double.parseDouble(priceMess[1]);
			}else {
				fail(request, response, "输入的价格格式有误");
				return;
			}
			condition = "select * from cosmeticForm where " + "cosmetic_price <=" + max + 
					" and cosmetic_price >=" + min;
		}
		HttpSession session = request.getSession(true);
		Connection con = null;
		DataBypage dataBean = null;
		try {
			dataBean = (DataBypage)session.getAttribute("dataBean");
			if(dataBean==null) {
				dataBean = new DataBypage();
				session.setAttribute("dataBean", dataBean);
			}
		}catch (Exception e) {
			dataBean = new DataBypage();
			session.setAttribute("dataBean", dataBean);
		}
		String uri = "jdbc:mysql://localhost/shop?&user=root&password=123456&serverTimezone=UTC";
		try {
			con = DriverManager.getConnection(uri);
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery(condition);
			rowSet = new CachedRowSetImpl(); //创建行集对象
			rowSet.populate(rs);
			dataBean.setRowSet(rowSet);
			con.close();
		}catch (SQLException exp) {}
			response.sendRedirect("byPageShow.jsp");
		
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		doPost(request, response);
	}
	public void fail(HttpServletRequest request, HttpServletResponse response,String backNews) {
		response.setCharacterEncoding("GB2312");
		try {
			PrintWriter out = response.getWriter();
			out.println("<html><body>");
			out.println("<h2>" + backNews + "</h2>");
			out.println("返回");
			out.println("<a href = searchCosmetic.jsp>查询化妆品</a>");
			out.println("</body></html>");
		} catch (IOException e) {
			// TODO: handle exception
		}
	}
}
