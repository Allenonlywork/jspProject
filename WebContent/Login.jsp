<%@ page contentType ="text/html;charset=GB2312" %>
<HEAD><%@ include file = "head.txt" %></HEAD>
<jsp:useBean id="loginBean" class ="mybean.data.Login" scope = "session"/>
<HTML>

<title>��¼ҳ��</title>
<BODY background = "images/bg_1.jpg" style="background-size:100% 100%;">
	<form action="loginServlet" method="post">
	<div style="height:50px"></div>
	<div align = center>
	<table border =2>
	
		<tr><th>��¼</th></tr>
		
		<tr>
			<td>��¼���ƣ�<input type = "text" name = "logname"></td>
		</tr>
		<tr>
			<td>�������룺<input type ="password" name = "password" ></td>
		</tr>
		
	</table>
	<div style="height:10px"></div>
	<input type = "submit" name = "tijiao" value="�ύ"/>
	</div>
	</form>
	<div align = center>
	<jsp:setProperty name = "loginBean" property ="*"/>
		��¼������Ϣ��<jsp:getProperty property ="backNews" name="loginBean"/>
		<br/>��¼���ƣ�<jsp:getProperty property = "logname" name = "loginBean"/>
	</div>
</BODY>
</HTML>

