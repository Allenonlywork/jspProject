<%@ page contentType ="text/html;charset=GB2312" %>
<HEAD><%@ include file = "head.txt" %></HEAD>
<jsp:useBean id="loginBean" class ="mybean.data.Login" scope = "session"/>
<HTML>

<title>登录页面</title>
<BODY background = "images/bg_1.jpg" style="background-size:100% 100%;">
	<form action="loginServlet" method="post">
	<div style="height:50px"></div>
	<div align = center>
	<table border =2>
	
		<tr><th>登录</th></tr>
		
		<tr>
			<td>登录名称：<input type = "text" name = "logname"></td>
		</tr>
		<tr>
			<td>输入密码：<input type ="password" name = "password" ></td>
		</tr>
		
	</table>
	<div style="height:10px"></div>
	<input type = "submit" name = "tijiao" value="提交"/>
	</div>
	</form>
	<div align = center>
	<jsp:setProperty name = "loginBean" property ="*"/>
		登录反馈信息：<jsp:getProperty property ="backNews" name="loginBean"/>
		<br/>登录名称：<jsp:getProperty property = "logname" name = "loginBean"/>
	</div>
</BODY>
</HTML>

