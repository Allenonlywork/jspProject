<%@ page contentType ="text/html;charset=GB2312" %>
<html>
<head><%@ include file="head.txt"%></head>
	<body background = "images/bg.jpg">
		<font size = 2>
		<div align = center>
			<br>��ѯʱ�������뻯ױƷ�İ汾�Ż�ױƷ���Ƽ��۸�.<br>
			��ױƷ����֧��ģ����ѯ
			<br>����۸�����2��ֵ֮��ļ۸񣬸�ʽ�ǣ��۸� 1-�۸� 2 <br>
			���磺 258-689
			<form action = "searchByConditionServlet" method = "post">
				<br>�����ѯ��Ϣ��<input type=text name = "searchMess"><br>
				<input type = radio name = "radio" value = "cosmetic_number">��ױƷ�汾��
				<input type = radio name = "radio" value = "cosmetic_name">��ױƷ����
				<input type = radio name = "radio" value = "cosmetic_price" checked="checked">��ױƷ�۸�<br>
				<input type = submit name = "g" value = "�ύ">
			</form>
		</div>
		</font>
	</body>
</html>