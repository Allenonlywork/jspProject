<%@ page contentType = "text/html;charset=GB2312" %>
<jsp:useBean id = "userBean" class = "mybean.data.Register" scope = "request"/>
<body background = "images/bg_1.jpg" style="background-size:100% 100%;">
<HEAD><%@ include file = "head.txt" %></HEAD>
<title>ע��ҳ��</title><center>
<form action="registerServlet" method="post">
<table>
	<tr><td height = "50"></td></tr>
	<tr height = "50"><td colspan = 4><Font size =2>(�û�������ĸ�����֡��»��߹��ɣ�*ע�͵��������д.)</Font></td></tr>
	<tr>
		<td><font style="color:red">*</font> �û����ƣ�</td><td><input type=text name="logname"></td>
		<td><font style="color:red">*</font> �û����룺</td><td><input type=password name="password"></td>
	</tr>
	<tr>
		<td><font style="color:red">*</font> �ظ����룺</td><td><input type=password name="again_password"></td>
		<td>&nbsp;&nbsp;��ϵ�绰��</td><td><input type=text name="phone"></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;�ʼĵ�ַ��</td><td><input type=text name="address"></td>
		<td>&nbsp;&nbsp;��ʵ������</td><td><input type=text name="realname"></td>
	</tr>
	<tr>
		<td></td>
		<td><input type=submit name="g" value ="�ύ"></td>
		<td><input type=reset name="reset" value = "����"></td>
		<td></td>
	</tr>
</table>
</form>
</div>
<div align="center"> 
	<jsp:setProperty name = "userBean" property ="*"/>
	ע�ᷴ����
	
	<jsp:getProperty property="backNews" name="userBean"/>
	<table border =3 >
	<tr>
		<td>��Ա���ƣ�</td>
		<td width = "100"><jsp:getProperty name="userBean" property="logname"/></td>
	</tr>
	<tr>
		<td>������</td>
		<td><jsp:getProperty property="realname" name="userBean"/></td>
	</tr>
	<tr>
		<td>��ַ��</td>
		<td><jsp:getProperty property="address" name="userBean"/></td>
	</tr>
	<tr>
		<td>�绰��</td>
		<td><jsp:getProperty property="phone" name="userBean"/></td>
	</tr>
	</table>
</div>
</Font>
</body></html>