
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); 
String login_status = (String)session.getAttribute("status");
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
        <title>添加员工信息</title>
    </head>
    <body bgcolor="lightgreen">
        <form action="http://localhost:8080/EIMS/staffManage/addStaffCheck.jsp" method="post">
            <table align="center"width="500" >
                <tr>
                    <td><a href="http://localhost:8080/EIMS/staffManage/lookStaff.jsp">员工查询</a></td>
                    <td>员工添加</td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <table align="center"width="300" >
                 <tr>
                    <th colspan="8" align="center">添加员工信息</th>
                 </tr>
                 <tr>
                     <td>姓名</td>
                     <td><input type="text" name="staffName"/></td>
                 </tr>
                 <tr>
                     <td>性别</td>
                     <td><input type="text" name="staffSex"/></td>
                 </tr>
                 <tr>
                     <td>年龄</td>
                     <td><input type="text" name="staffAge"/></td>
                 </tr>
                 <tr>
                     <td>学历</td>
                     <td><input type="text" name="staffEducation"/></td>
                </tr>
                <tr>
                     <td>部门</td>
                     <td><input type="text" name="staffDepartment"/></td>
                </tr>
                <tr>
                     <td>入职时间</td>
                     <td><input type="text" name="staffDate"/></td>
                </tr>
                <tr>
                     <td>职务</td>
                     <td><input type="text" name="staffDuty"/></td>
                </tr>
                <tr>
                     <td>工资</td>
                     <td><input type="text" name="staffWage"/></td>
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
