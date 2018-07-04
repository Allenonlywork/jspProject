<%@ page contentType ="text/html;charset=GB2312" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "mybean.data.Login" %>
<jsp:useBean id="loginBean" class ="mybean.data.Login" scope = "session"></jsp:useBean>
<HTML><BODY>
<HEAD><%@ include file = "head.txt" %></HEAD>
<title>浏览化妆品</title>
</head>
<body background = "images/bg.jpg">
	<div align="center">
	<% 
	if(loginBean == null){
		response.sendRedirect("Login.jsp");	//重定向到登录页面
	
	}else{
		boolean b = loginBean.getlogname()==null||loginBean.getlogname().length()==0;
		if(b){
			response.sendRedirect("Login.jsp"); //重定向到登录页面
		}
	}
	String numberID = request.getParameter("xijie");
	out.print("<th>产品号"+numberID);
	if(numberID ==null){
		out.print("没有产品号，无法查看细节");
		return;
	}
	Connection con;
	Statement sql;
	ResultSet rs;
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		
	}
	String uri = "jdbc:mysql://localhost/shop?&user=root&password=123456&serverTimezone=UTC";
	try{
		con = DriverManager.getConnection(uri);
		sql = con.createStatement();
		String cdn = "select * from cosmeticForm where cosmetic_number = '"+ numberID + "'";
		rs = sql.executeQuery(cdn);
		out.print("<table border =2>");
		out.print("<tr>");
		out.print("<th>产品号</th>");
		out.print("<th>名称</th>");
		out.print("<th>制造商</th>");
		out.print("<th>价格</th>");
		out.print("<th><font color = blue>加入购物车</font></th>");
		out.print("</tr>");
		String picture = "";
		String detailMess ="";
		while(rs.next()){
			String number = rs.getString(1);
			String name = rs.getString(2);
			String maker = rs.getString(3);
			String price = rs.getString(4);
			detailMess = rs.getString(5);
			picture = rs.getString(6);
			String goods = "(" + number + "," + name + "," + maker + "," + price + ")#" + price;
			goods = goods.replaceAll("\\p{Blank}", "");
			String button = "<form action ='putGoodsServlet' method ='post'>" +
			"<input type = 'hidden' name = 'java' value = "+ goods +">" +
			"<input type = 'submit' value = '放入购物车'></form>";
			
					
			out.print("<tr>");
			out.print("<td>" + number + "</td>");
			out.print("<td>" + name + "</td>");
			out.print("<td>" + maker + "</td>");
			out.print("<td>" + price + "</td>");
		
			out.print("<td>" + button + "</td>");
			out.print("<tr>");
		}
		out.print("</tabel>");
		out.print("产品详情：<br>");
		out.println("<div align = center>" + detailMess + "</div>");
		String pic = "<img src = 'images/" + picture + "' width = 260 height =200></img>";
		out.print(pic);
		con.close();
		
	}catch(SQLException exp){}
	
	%>
	
	
	</div>

</body>
</html>