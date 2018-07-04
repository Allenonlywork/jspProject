package myservlet.control;

import com.sun.rowset.*;
import java.io.IOException;
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



import mybean.data.DataBypage;


public class QueryAllRecord extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	CachedRowSetImpl rowSet = null;
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e){
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GB2312");
		String idNumber = request.getParameter("fenleiNumber");
		if(idNumber == null) {
			idNumber = "0";
		}
		int id = Integer.parseInt(idNumber);
		HttpSession session = request.getSession(true);
		Connection con = null;
		DataBypage dataBean = null;
		
		try {
			dataBean = (DataBypage)session.getAttribute("dataBean");
			if(dataBean == null) {
				dataBean = new DataBypage();  //创建Javabean 对象
				session.setAttribute("dataBean", dataBean);
			}
		} catch (Exception exp) {
			dataBean = new DataBypage();
			session.setAttribute("dataBean",dataBean);
		}
		String uri = "jdbc:mysql://localhost/shop?user=root&password=123456&serverTimezone=UTC";
		try {
			con = DriverManager.getConnection(uri);
			Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery("select * from cosmeticForm where id = " + id);
			rowSet = new CachedRowSetImpl();	//创建行集对象
			rowSet.populate(rs);
			
			dataBean.setRowSet(rowSet);		//行集数据存储在dataBean中
			con.close(); 	//关闭连接
			
		}catch(SQLException exp){}
			response.sendRedirect("byPageShow.jsp");		//重定向到 byPageShow.jsp
		
	}
		public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
			doPost(request, response);
		}
}
