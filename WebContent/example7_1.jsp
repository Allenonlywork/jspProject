<%@ page contentType = "text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html><body bgcolor=#EEDDFF>
<% 
	Connection con;
	Statement sql;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(Exception e){
		out.println("忘记把MYSQL数据库的JDBC数据库驱动程序复制到JDK的扩展目录下");	
	}
	try{
		String uri = "jdbc:mysql://localhost/warehouse?&serverTimezone=UTC";
		String user = "root";
		String password = "123456";
		con = DriverManager.getConnection(uri, user, password);
		sql = con.createStatement();
		rs = sql.executeQuery("SELECT * FROM product");
		out.print("<table border = 2>");
		out.print("<tr>");
			out.print("<th width = 100>"+"产品号");
			out.print("<th width = 100>"+"名称");
			out.print("<th width = 50>"+"生产日期");
			out.print("<th width = 50>"+"价格");
		out.println("</tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>"+rs.getString(1)+"</td>");
			//out.print("<td>"+rs.getString(2)+"</td>");
			//out.print("<td>"+rs.getDate("madeTime")+"</td>");
			//out.print("<td>"+rs.getFloat("price")+"</td>");
		out.println("</tr>");
		}
		out.print("</table>");
		con.close();
	}
	catch(SQLException e){
		out.print(e);
	}
	
%>