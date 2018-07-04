<%@ page contentType = "text/html;charset=GB2312" %>
<jsp:useBean id = "userBean" class = "mybean.data.Register" scope = "request"/>
<body background = "images/bg_1.jpg" style="background-size:100% 100%;">
<HEAD><%@ include file = "head.txt" %></HEAD>
<title>注册页面</title><center>
<form action="registerServlet" method="post">
<table>
	<tr><td height = "50"></td></tr>
	<tr height = "50"><td colspan = 4><Font size =2>(用户名由字母、数字、下划线构成，*注释的项必须填写.)</Font></td></tr>
	<tr>
		<td><font style="color:red">*</font> 用户名称：</td><td><input type=text name="logname"></td>
		<td><font style="color:red">*</font> 用户密码：</td><td><input type=password name="password"></td>
	</tr>
	<tr>
		<td><font style="color:red">*</font> 重复密码：</td><td><input type=password name="again_password"></td>
		<td>&nbsp;&nbsp;联系电话：</td><td><input type=text name="phone"></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;邮寄地址：</td><td><input type=text name="address"></td>
		<td>&nbsp;&nbsp;真实姓名：</td><td><input type=text name="realname"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type=submit name="g" value ="提交"></td>
		<td><input type=reset name="reset" value = "重置"></td>
		<td></td>
	</tr>
</table>
</form>
</div>
<div align="center"> 
	<jsp:setProperty name = "userBean" property ="*"/>
	注册反馈：
	
	<jsp:getProperty property="backNews" name="userBean"/>
	<table border =3 >
	<tr>
		<td>会员名称：</td>
		<td width = "100"><jsp:getProperty name="userBean" property="logname"/></td>
	</tr>
	<tr>
		<td>姓名：</td>
		<td><jsp:getProperty property="realname" name="userBean"/></td>
	</tr>
	<tr>
		<td>地址：</td>
		<td><jsp:getProperty property="address" name="userBean"/></td>
	</tr>
	<tr>
		<td>电话：</td>
		<td><jsp:getProperty property="phone" name="userBean"/></td>
	</tr>
	</table>
</div>
</Font>
</body></html>