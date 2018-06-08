<%-- 未测试 jsp --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	java.sql.Connection sqlCon;
	java.sql.Statement sqlStmt;
	java.sql.ResultSet sqlRst;
	String strCon;
	int intPageSize;
	int intRowCount;
	int intPageCount;
	int intPage;
	int layer;
	int idlayer;
	idlayer = 1;
	String outtext = "";
	String strPage;
	int j;
	int i;
	intPageSize = 2;
	strPage = request.getParameter("page");
	if (strPage == null) {
		intPage = 1;
	} else {
		intPage = Integer.parseInt(strPage);
		if (intPage < 1)
			intPage = 1;
	}
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	sqlCon = java.sql.DriverManager.getConnection("jdbc:mysql://192.168.14.5:3306/sample", "root", "kali");
	sqlStmt = sqlCon.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE,
			java.sql.ResultSet.CONCUR_READ_ONLY);
	sqlRst = sqlStmt.executeQuery("select customerid.phone from customer");
	sqlRst.last();
	intRowCount = sqlRst.getRow();
	intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
	if (intPage > intPageCount)
		intPage = intPageCount;
%>;



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body topmargin="0" leftmargin="0">
	<table width="100%">
		<tr>
			<td>页次:<%=intPage%>/<%=intPageCount%>页 <%=intPageSize%>条/页
			</td>
		</tr>
	</table>
	<table width="100%">
		<tr>
			<td width="50%">ID</td>
			<td width="50%">phone</td>
		</tr>
		<%
			if (intPageCount > 0) {
				sqlRst.absolute((intPage - 1) * intPageSize + 1);
				i = 1;
				while (i < intPageSize && !sqlRst.isAfterLast()) {

					String id = sqlRst.getString(1);
					String phone = sqlRst.getString(2);
		%>
		<tr>
			<td width="50%"><%=id%></td>
			<td width="50%"><%=phone%></td>
		</tr>
		<%
			sqlRst.next();
					i++;
				}
			}
		%>

	</table>
	<%
		if (intPage > 1) {
	%>
	<a href="page.jsp?page=<%=intPage - 1%>">上一页</a>
	<%
		}
	%>
	<%
		if (intPage < intPageCount) {
	%>
	<a href="page.jsp?page=<%=intPage + 1%>">下一页</a>
	<%
		}
	%>
</body>
</html>
<%sqlRst.close();
sqlStmt.close();
sqlCon.close();%>