<%@ page contentType ="text/html;charset=GB2312" %>
<jsp:useBean id="loginBean" class="mybean.data.Login" scope = "session"></jsp:useBean>
<%@ page import = "java.sql.*" %>
<html>
<head><%@ include file = "head.txt" %></head>
<title>订单页</title>
<body>
	<div align = center>
	<%
		if(loginBean == null){
			response.sendRedirect("Login.jsp"); //重定向到登录页面
		}else{
			boolean b = loginBean.getlogname() == null||
					loginBean.getlogname().length()==0;
			if(b){
				response.sendRedirect("Login.jsp");
			}
		}
	Connection con;
	Statement sql;
	ResultSet rs;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){}
	
	try{
		String uri = "jdbc:mysql://localhost/shop?user=root&password=123456&serverTimezone=UTC";
		con = DriverManager.getConnection(uri);
		sql = con.createStatement();
		String cdn = "select id,mess,sum from orderForm where logname='" + loginBean.getlogname() +"'";
		rs = sql.executeQuery(cdn);
		out.print("<table border = 2>");
		out.print("<tr>");
		out.print("<td width = 100>订单号</td>");
		out.print("<td width = 100>信息</td>");
		out.print("<td width = 100>价格</td>");
		out.print("<tr>");
		while(rs.next()){
			out.print("<tr>");
			out.print("<td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getString(3) + "</td>");
			out.print("<tr>");
		}
	}catch(SQLException e){
		out.print(e);
	}
	%>
	</div>

</body>

</html>