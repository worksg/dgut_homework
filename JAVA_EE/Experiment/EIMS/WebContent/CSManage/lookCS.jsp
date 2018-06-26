

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8");String login_status = (String)session.getAttribute("status");
if (login_status == null || login_status.equals("anonymous")) {
    out.append("匿名用户，请登录后访问！\n两秒后自动跳转到登录页面");
    String content = "2;URL=/EIMS/login.jsp";
    response.setHeader("REFRESH", content);
    return ;
} %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>售后查询</title>
</head>
<body bgcolor="lightgreen">
	<table align="center" width="500">
		<tr>
			<td>售后查询</td>
			<td><a href="http://localhost:8080/EIMS/CSManage/addCS.jsp">售后添加</a></td>
		</tr>
	</table>
	<br>
	<hr>
	<br>
	<table align="center" width="700" border=2" >
		<tr>
			<th colspan="3">查看售后信息</th>
		</tr>
		<tr>
			<td>客户姓名</td>
			<td>客户反馈意见</td>
			<td>业务员</td>
		</tr>
		<%
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/eims";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql="select * from cs";
                rs=stmt.executeQuery(sql);
                while(rs.next()){
            %>
		<tr>
			<td><%=rs.getString("clientName")%></td>
			<td><%=rs.getString("clientOpinion")%></td>
			<td><%=rs.getString("StaffName")%></td>
		</tr>
		<%
                }
           %>
	</table>
</body>
</html>

