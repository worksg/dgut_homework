

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
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
        <title>产品查询</title>
    </head>
    <body bgcolor="lightgreen">
        <table align="center"width="500">
            <tr>
                <td>产品查询</td>
                <td><a href="http://localhost:8080/EIMS/productManage/addProduct.jsp">产品添加</a></td>
             </tr>
        </table>
        <br>
        <hr>
        <br>
         <table align="center"width="700"border=2" >
            <tr>
                <th colspan="4">查看产品信息</th>
            </tr>
            <tr>
                <td>产品名称</td>
                <td>产品型号</td>
                <td>产品数量</td>
                <td>产品价格</td>    
            </tr>
            <%
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/eims";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql="select * from product";
                rs=stmt.executeQuery(sql);
                while(rs.next()){
            %>                         
           <tr>
               <td><%=rs.getString("productName")%></td>
               <td><%=rs.getString("productModel")%></td>
               <td><%=rs.getString("productNumber")%></td>
               <td><%=rs.getString("productPrice")%></td>                 
           </tr>
           <%
                }
           %>
        </table>
    </body>
</html>

