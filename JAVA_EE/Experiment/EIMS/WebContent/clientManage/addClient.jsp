
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
<title>添加客户信息</title>
</head>
<body bgcolor="lightgreen">
	<form
		action="http://localhost:8080/EIMS/clientManage/addClientCheck.jsp"
		method="post">
		<table align="center" width="500">
			<tr>
				<td><a
					href="http://localhost:8080/EIMS/clientManage/lookClient.jsp">客户查询</a></td>
				<td>客户添加</td>
				<td><a
					href="http://localhost:8080/EIMS/clientManage/updateClient.jsp">客户修改</a></td>
				<td><a
					href="http://localhost:8080/EIMS/clientManage/deleteClient.jsp">客户删除</a></td>
			</tr>
		</table>
		<br>
		<hr>
		<br>
		<table align="center" width="300">
			<tr>
				<th colspan="4" align="center">添加客户信息</th>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input type="text" name="clientName" /></td>
			</tr>
			<tr>
				<td>电话</td>
				<td><input type="text" name="clientTelephone" /></td>
			</tr>
			<tr>
				<td>地址</td>
				<td><input type="text" name="clientAddress" /></td>
			</tr>
			<tr>
				<td>邮箱</td>
				<td><input type="text" name="clientEmail" /></td>
			</tr>
			<tr align="center">
				<td colspan="2"><input name="sure" type="submit" value="确认">
					&nbsp; &nbsp; &nbsp; &nbsp; <input name="clear" type="reset"
					value="取消"></td>
			</tr>
		</table>
	</form>
</body>
</html>
