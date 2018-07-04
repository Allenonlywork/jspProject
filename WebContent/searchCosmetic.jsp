<%@ page contentType ="text/html;charset=GB2312" %>
<html>
<head><%@ include file="head.txt"%></head>
	<body background = "images/bg.jpg">
		<font size = 2>
		<div align = center>
			<br>查询时可以输入化妆品的版本号或化妆品名称及价格.<br>
			化妆品名称支持模糊查询
			<br>输入价格是在2个值之间的价格，格式是：价格 1-价格 2 <br>
			例如： 258-689
			<form action = "searchByConditionServlet" method = "post">
				<br>输入查询信息：<input type=text name = "searchMess"><br>
				<input type = radio name = "radio" value = "cosmetic_number">化妆品版本号
				<input type = radio name = "radio" value = "cosmetic_name">化妆品名称
				<input type = radio name = "radio" value = "cosmetic_price" checked="checked">化妆品价格<br>
				<input type = submit name = "g" value = "提交">
			</form>
		</div>
		</font>
	</body>
</html>