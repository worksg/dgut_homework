<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<%
    java.sql.Connection conn = null;
    java.lang.String strConn;
    java.sql.Statement sqlStmt = null; //语句对象 
    java.sql.ResultSet sqlRst = null; //结果集对象
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(
                "jdbc:mysql://192.168.14.5:3306/sample", "root", "kali");
        sqlStmt = conn.createStatement(java.sql.ResultSet.TYPE_SCROLL_INSENSITIVE, java.sql.ResultSet.CONCUR_READ_ONLY);
//执行sql语句
        String sqlQuery = "select customerid,address,phone from customer";
        sqlRst = sqlStmt.executeQuery(sqlQuery);
%>
<center>顾客信息表</center>
<table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
    <tr> 
        <td align="center">&nbsp;ID</td> 
        <td align="center">地址</td> 
        <td align="center">电话</td> 
    </tr> 
    <% while (sqlRst.next()) { //取得下一条记录%> 
    <tr><!--显示记录--> 
        <td><%=sqlRst.getString("customerid")%></td> 
        <td><%=new String(sqlRst.getString("address").getBytes("UTF-8"))%></td> 
        <td><%=sqlRst.getString("phone")%></td>
    </tr> 
    <% } %> 
</table>
<%
	} catch (java.sql.SQLException e) {
		out.println(e.toString());
	} finally {
		//关闭结果集对象
		if (sqlRst != null) {

			try {
				sqlRst.close();
			} catch (SQLException e) {
				out.println(e.toString());
			}
		}
		//关闭语句对象
		if (sqlStmt != null) {
			try {
				sqlStmt.close();
			} catch (SQLException e) {
				out.println(e.toString());
			}
		}
		//关闭数据库连接
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				out.println(e.toString());
			}
		}
	}
%>

