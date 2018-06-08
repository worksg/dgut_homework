<%-- 未测试 jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.io.*,java.sql.*,javax.sql.*,java.io.*,javax.naming.*"%>
<%
	Connection conn = null;
	String stcConn;
	PreparedStatement preparedStmt = null;
	ResultSet sqlRst;
	InitialContext context = null;
	FileInputStream fis = null;
	try {
		context = new InitialContext();
		DataSource dataSource = (DataSource) context.lookup("java:comp/env/sample");
		conn = dataSource.getConnection();
		String filelocation = request.getParameter("file");
		File files = new File(filelocation);
		fis = new FileInputStream(files);
		preparedStmt = conn.prepareStatement("INSERT INTO album (name,data)" + "VALUES(?,?)");
		preparedStmt.setString(1, request.getParameter("name"));
		preparedStmt.setBinaryStream(2, fis, (int) files.length());
		preparedStmt.executeUpdate();
		out.println("操作成功!");
%>

<%
	} catch (java.sql.SQLException e) {
		out.println(e.toString());
	} finally {
		if (fis != null)
			fis.close();
		if (preparedStmt != null)
			preparedStmt.close();
		if (conn != null)
			conn.close();
		if (context != null)
			context.close();
	}
%>