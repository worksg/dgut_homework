
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); String login_status = (String)session.getAttribute("status");
if (login_status == null || login_status.equals("anonymous")) {
    out.append("匿名用户，请登录后访问！\n两秒后自动跳转到登录页面");
    String content = "2;URL=/EIMS/login.jsp";
    response.setHeader("REFRESH", content);
    return ;
}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加合同信息</title>
    </head>
    <body bgcolor="lightgreen">
        <form action="http://localhost:8080/EIMS/contactManage/addContactCheck.jsp" method="post">
            <table align="center"width="500" >
                <tr>
                    <td><a href="http://localhost:8080/EIMS/contactManage/lookContact.jsp">合同查询</a></td>
                    <td>合同添加</td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <table align="center"width="300" >
                 <tr>
                    <th colspan="6" align="center">添加合同信息</th>
                 </tr>
                 <tr>
                     <td>客户姓名</td>
                     <td><input type="text" name="clientName"/></td>
                 </tr>
                 <tr>
                     <td>合同名称</td>
                     <td><input type="text" name="contactName"/></td>
                 </tr>
                 <tr>
                     <td>合同内容</td>
                     <td><input type="text" name="contactContents"/></td>
                 </tr>
                 <tr>
                     <td>合同生效日期</td>
                     <td><input type="text" name="contactStart"/></td>
                </tr>
                <tr>
                     <td>合同有效期</td>
                     <td><input type="text" name="contactEnd"/></td>
                </tr>
                <tr>
                     <td>业务员</td>
                     <td><input type="text" name="StaffName"/></td>
                </tr>
                <tr align="center">
                     <td colspan="2">
                         <input name="sure"type="submit"value="确认">
                         &nbsp; &nbsp; &nbsp; &nbsp;
                         <input name="clear"type="reset"value="取消">
                     </td>
                </tr>
            </table>
        </form>
    </body>
</html>
