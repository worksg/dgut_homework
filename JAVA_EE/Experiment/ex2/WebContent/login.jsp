<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页</title>
</head>

<%!public void jspInit() {
		System.out.println("登录页面初始化");
	}%>

<%!public class tools {
		public boolean isExist(String path) throws IOException {
			File file = new File(path);
			if (!file.exists() || file.length() == 0) {
				file.createNewFile();
				return false;
			} else {
				return true;
			}

		}
		public void write(String file_path, String json)
				throws FileNotFoundException, UnsupportedEncodingException, IOException {
			FileOutputStream writerStream = new FileOutputStream(file_path, true);
			BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(writerStream, "UTF-8"));
			writer.write(json);
			writer.close();
		}

	}%>

<%
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	String username = "";
	String userpass = "";
	if (request.getMethod().equals("POST") && request.getParameter("username") != null
			&& request.getParameter("userpass") != null) {
		username = request.getParameter("username");
		userpass = request.getParameter("userpass");
	}
%>

<body>
	<%
		if (!(username.equals("") || userpass.equals(""))) {
	%>
	<%
		//登录模块
			tools tools = new tools();
			String fileName = "register_info.txt";
			String filePath = this.getServletContext().getRealPath("/");
			String RealfilePath = filePath + fileName;

			System.out.println(RealfilePath);
			if (tools.isExist(RealfilePath) == false) {
				File file = new File(RealfilePath);
				try {
					file.createNewFile();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} ;
			FileInputStream file = new FileInputStream(RealfilePath);
			InputStreamReader reader = new InputStreamReader(file, "UTF-8");
			BufferedReader bufferReader = new BufferedReader(reader);
			String line = null;
			List<String> lines = new ArrayList<String>();
			while ((line = bufferReader.readLine()) != null) {
				lines.add(line);
			}
			bufferReader.close();

			boolean login_success = false;
			for (String oneItem : lines) {
				String[] parts = oneItem.split("\t");
				if (parts[0].equals(username) && parts[1].equals(userpass)) {
					session.getServletContext().setAttribute("upload_allow", true);
					login_success = true;
					break;
				}
			}
			if (!login_success) {
				out.append("用户名或者密码错误，请重新输入！");
				String content = "2;URL=login.jsp";
				response.setHeader("REFRESH", content);
			} else {
				response.sendRedirect("index.jsp");
			}
	%>
	<%
		} else {
	%>
	<form name="login_form" method="POST">
		<table frame="box" cellspacing="5" align="center">
			<tr>
				<td colspan="2" align="center"><p>
					<h3>用户登录</h3>
					</p></td>
			</tr>
			<tr>
				<td><label for="username">用户名</label></td>
				<td><input id="username" type="text" name="username" value="" /></td>
			</tr>
			<tr>
				<td><label for="userpass">密码</label></td>
				<td><input id="password" type="password" name="userpass"
					value="" /></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="注册账号"
					onclick="javascript:window.location.href='/ex2/register.jsp'">
					<input type="button" value="登录" onclick="javascript:getValue();">
				</td>
			</tr>
		</table>
	</form>
	<script>
		function getValue() {
			var username = document.getElementById("username").value;
			var userpass = document.getElementById("password").value;
			if (checkSpecialChars(username, userpass)) {
				document.forms['login_form'].submit();
			} else {
				alert("账号或者密码有特殊字符或为空!")
			}
		}
		function checkSpecialChars(username, userpass) {
			const regex = /^[a-zA-Z0-9_]+$/;
			return username.match(regex) != null
					&& userpass.match(regex) != null
		}
	</script>
	<%
		}
	%>
</body>
</html>