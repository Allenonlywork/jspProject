<%@ page contentType ="text/html;charset=GB2312" %>
<%@ page import ="mybean.data.DataBypage" %>
<%@ page import ="com.sun.rowset.*" %>

<jsp:useBean id ="dataBean" class = "mybean.data.DataBypage" scope = "session" />

<HTML><BODY>
<HEAD><%@ include file = "head.txt" %></HEAD>
<title>�����ױƷ</title>
</head>
<body  background = "images/bg.jpg">
	<div align = center>
		<br>��ǰ��ʾ�������ǣ�
		<table border = "2" align = "center">
			<tr>
				<th>��ױƷ��־��</th>
				<th>��ױƷ����</th>
				<th>��ױƷ������</th>
				<th>��ױƷ�۸�</th>
				<th>�鿴����</th>
				<td><font color=blue>��ӵ����ﳵ</font></td>
			</tr>
			<jsp:setProperty property="pageSize" name="dataBean" param="pageSize"/>
			<jsp:setProperty property="currentPage" name="dataBean" param="currentPage"/>
			<br/>
			<%
			CachedRowSetImpl rowSet = dataBean.getRowSet();
			
			if(rowSet ==null){
				out.print("û���κβ�ѯ��Ϣ���޷����");
				return;
			}
			rowSet.last();
			
			int totalRecord = rowSet.getRow();
			out.println("ȫ����¼����"+totalRecord);
			int pageSize = dataBean.getPageSize();
			int totalPages = dataBean.getTotalPages();
			if(totalPages%pageSize==0){
				totalPages = totalRecord/pageSize;
			}else{
				totalPages = totalRecord/pageSize + 1;
			}
			dataBean.setPageSize(pageSize);
			dataBean.setTotalPages(totalPages);
			if(totalPages>=1){
				if(dataBean.getCurrentPage() <1){
					dataBean.setCurrentPage(dataBean.getTotalPages());
				}
				if(dataBean.getCurrentPage() > dataBean.getTotalPages()){
					dataBean.setCurrentPage(1);
				}
				int index = (dataBean.getCurrentPage() -1)*pageSize +1;
				rowSet.absolute(index);
				boolean boo = true;
				for(int i = 0;i<pageSize&&boo;i++){
					String number = rowSet.getString(1);
					String name = rowSet.getString(2);
					String maker = rowSet.getString(3);
					String price = rowSet.getString(4);
					String goods = "(" + number + "," + name + "," + maker + "," + price + ")#" + price;
					goods = goods.replaceAll("\\p{Blank}", "");
					String button = "<form action ='putGoodsServlet' method ='post'>" +
					"<input type = 'hidden' name = 'java' value = "+ goods +">" +
					"<input type = 'submit' value = '���빺�ﳵ'></form>";
					String detail = "<form action ='showDetail.jsp' method ='post'>" +
							"<input type = 'hidden' name = 'xijie' value = "+ number +">" +
							"<input type = 'submit' value = '�鿴ϸ��'></form>";
							
					out.print("<tr>");
					out.print("<td>" + number + "</td>");
					out.print("<td>" + name + "</td>");
					out.print("<td>" + maker + "</td>");
					out.print("<td>" + price + "</td>");
					out.print("<td>" + detail + "</td>");
					out.print("<td>" + button + "</td>");
					out.print("<tr>");
					boo = rowSet.next();
				}
			}
			%>
		</table>
	<br>ÿҳ�����ʾ<jsp:getProperty property="pageSize" name="dataBean"/>����Ϣ
	<br>��ǰ��ʾ��<font color = blue>
	<jsp:getProperty property="currentPage" name="dataBean"/></font>
	ҳ������<font color=blue><jsp:getProperty property="totalPages" name="dataBean"/></font>ҳ
	
	<table>
		<tr>
			<td>
				<form action = "" method = "post">
					<input type = hidden name = "currentPage" value = "<%=dataBean.getCurrentPage() -1 %>">
					<input type = submit name = "g" value = "��һҳ"> 
				</form>
			</td>
			<td>
				<form action = "" method = "post">
					<input type = hidden name = "currentPage" value = "<%=dataBean.getCurrentPage() +1 %>">
					<input type = submit name = "g" value = "��һҳ"> 
				</form>
			</td>
		</tr>
		<tr>
			<td>
				<form action = "" method = "post">
				ÿҳ��ʾ<input type = text name = "pageSize" value =1 size =3>����¼
				<input type = submit name = "g" value = "ȷ��">
				</form>
			</td>
			<td>
				<form action = "" method = "post">
				����ҳ��<input type = text name = "currentPage" size =2>
				<input type = submit name = "g" value = "�ύ">
				</form>
			</td>
		</tr>
		
	</table>

</div>
</body>
</html>