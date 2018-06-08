<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	Connection conn = null;
	String strConn;
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
	} catch (ClassNotFoundException e) {
		out.println(e.toString());
	}

	try {
		conn = DriverManager.getConnection(
				"jdbc:mysql://192.168.14.5:3306/sample", "root", "kali");
%>
连接Mysql数据库成功!
<%
	} catch (java.sql.SQLException e) {
		out.println(e.toString());
	} finally {
		if (conn != null)
			conn.close();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>

</body>
</html>