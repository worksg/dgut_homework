
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); String login_status = (String)session.getAttribute("status");
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
        <title>企业信息管理系统--主页面</title>
    </head>
        <frameset rows="*" cols="120,*" >
            <frame src="left.jsp" name="left" scrolling="no" />
            <frameset rows="180,*" cols="*">
                <frame src="top.jsp" name="top" scrolling="no"/>
                <frame src="bottom.jsp" name="main" />
            </frameset>
        </frameset>
</html>
