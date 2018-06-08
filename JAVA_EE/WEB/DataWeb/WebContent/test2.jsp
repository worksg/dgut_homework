<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<title>基于连接池和数据源访问数据库</title>
</head>

<body>
	<h1>顾客信息</h1>

	<%
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:comp/env");
		DataSource dataSource = (DataSource) envContext.lookup("jdbc/sample");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rset = null;
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from customer");
			if (rset.next()) {
	%>
	<table width="100%" border="1">
		<tr align="left">
			<th>顾客ID</th>
			<th>地址</th>
			<th>电话</th>
		</tr>
		<%
			do {
		%>
		<tr>
			<td><%=rset.getString("customerid")%></td>
			<td><%=rset.getString("address")%></td>
			<td><%=rset.getString("phone")%></td>
		</tr>
		<%
			} while (rset.next());
		%>
	</table>
	<%
		} else {
	%>
	No results from query
	<%
		}
		} catch (SQLException e) {
	%>
	<%=e.getMessage()%>
	<%
		e.printStackTrace();
		} finally {
			if (rset != null) {
				rset.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (initContext != null) {
				initContext.close();
			}
		}
	%>
</body>
</html>
