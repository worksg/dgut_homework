<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	response.setCharacterEncoding("UTF-8");
	String action = (String)request.getParameter("action");
	if(action != null && action.equals("logout")){
		session.setAttribute("status","anonymous");
		response.sendRedirect("/EIMS/login.jsp");
	}
%>
<!DOCTYPE html>

<html>
<head>
<title>企业信息管理系统--登录页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body background="image/login_new.jpg">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<center>
		<form action="loginCheck.jsp" method="post">
			<table border="0">
				<tr>
					<td>
						<table border="1" cellspacing="0" cellpadding="0"
							bgcolor="#ffffff" width="360" height="200">
							<tr height="130">
								<td align="center">用户姓名 <input type="text" name="userName"
									size="22"><br> <br> <br>用户密码 <input
									type="password" name="password" size="22"><br> <br>
									<br> <input type="submit" value="登 录" size="12" />&nbsp;&nbsp;&nbsp;
									<input type="reset" value="清  除" size="12" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>