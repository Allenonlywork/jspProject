<%@ page contentType ="text/html;charset=GB2312" %>
<%@ page import = "java.sql.*" %>

<HTML><BODY>
<HEAD><%@ include file = "head.txt" %></HEAD>
<title>浏览化妆品</title>
</head>
<body background = "images/bg.jpg">
	<div align="center" style ="position:relative;top:40px">
		<% try{
			Class.forName("com.mysql.jdbc.Driver");	
			}
		catch(Exception e){}
			
		String uri = "jdbc:mysql://localhost/shop?user=root&password=123456&serverTimezone=UTC";
		Connection con;
		Statement sql;
		ResultSet rs;
		
		try{
			con = DriverManager.getConnection(uri);
			sql = con.createStatement();
			//读取classify 表，获得分类
			rs = sql.executeQuery("select * from classify ");
			out.print("<form action='queryServlet' method = 'post'>");
			out.print("<select name = 'fenleiNumber'>");
			while(rs.next()){
				int id = rs.getInt(1);
				String name = rs.getString(2);
				out.print("<option value = " + id +">" +name + "</option>");
			}
			out.print("</select>");
			out.print("<input type = 'submit' name='g' value = '提交'>");
			out.print("</form>");
			con.close();
		}catch(SQLException e){
			out.print(e);
		}%>
		
		
	</div>

</body>
</html>