
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>添加合同信息</title>
    </head>
    <body bgcolor="lightgreen">
        <form action="http://localhost:8080/EIMS/CSManage/addCSCheck.jsp" method="post">
            <table align="center"width="500" >
                <tr>
                    <td><a href="http://localhost:8080/EIMS/CSManage/lookCS.jsp">售后查询</a></td>
                    <td>售后添加</td>
                </tr>
            </table>
            <br>
            <hr>
            <br>
            <table align="center"width="300" >
                 <tr>
                    <th colspan="3" align="center">添加售后信息</th>
                 </tr>
                 <tr>
                     <td>客户姓名</td>
                     <td><input type="text" name="clientName"/></td>
                 </tr>
                 <tr>
                     <td>客户反馈意见</td>
                     <td><input type="text" name="clientOpinion"/></td>
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
