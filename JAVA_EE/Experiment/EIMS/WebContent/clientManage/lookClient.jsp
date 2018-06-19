

<%@page import="java.sql.*"%>
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
        <title>客户查询</title>
    </head>
    <body bgcolor="lightgreen">
        <table align="center"width="500">
            <tr>
                <td>客户查询</td>
                <td><a href="http://localhost:8080/EIMS/clientManage/addClient.jsp">客户添加</a></td>
                <td><a href="http://localhost:8080/EIMS/clientManage/updateClient.jsp">客户修改</a></td>
                <td><a href="http://localhost:8080/EIMS/clientManage/deleteClient.jsp">客户删除</a></td>
             </tr>
        </table>
        <br>
        <hr>
        <br>
         <table align="center"width="700"border=2" >
            <tr>
                <th colspan="4">查看客户信息</th>
            </tr>
            <tr>
                <td>姓名</td>
                <td>电话</td>
                <td>地址</td>
                <td>邮箱 </td>    
            </tr>
            <%
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/eims";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql="select * from client";
                rs=stmt.executeQuery(sql);
                while(rs.next()){
            %>                         
           <tr>
               <td><%=rs.getString("clientName")%></td>
               <td><%=rs.getString("clientTelephone")%></td>
               <td><%=rs.getString("clientAddress")%></td>
               <td><%=rs.getString("clientEmail")%></td>                 
           </tr>
           <%
                }
           %>
        </table>
    </body>
</html>

