
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("utf-8");
%>
<title>查询条件</title>
</head>
<body>
	<form action="searchResult.jsp" method="post">
		<label>顾客姓名：</label> <input name="parm" value=""> </input> <input
			type="submit" name="Submit2" value="提交"> <input type="reset"
			name="Submit" value="清空">
	</form>
</body>
</html>
