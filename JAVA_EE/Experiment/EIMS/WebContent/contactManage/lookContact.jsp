
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>合同查询</title>
    </head>
    <body bgcolor="lightgreen">
        <table align="center"width="500">
            <tr>
                <td>合同查询</td>
                <td><a href="http://localhost:8080/EIMS/contactManage/addContact.jsp">合同添加</a></td>
             </tr>
        </table>
        <br>
        <hr>
        <br>
         <table align="center"width="700"border=2" >
            <tr>
                <th colspan="6">查看合同信息</th>
            </tr>
            <tr>
                <td>客户姓名</td>
                <td>合同名称</td>
                <td>合同内容</td>
                <td>合同生效日期</td> 
                <td>合同有效期</td> 
                <td>业务员</td> 
            </tr>
            <%
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/eims";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql="select * from contact";
                rs=stmt.executeQuery(sql);
                while(rs.next()){
            %>                         
           <tr>
               <td><%=rs.getString("clientName")%></td>
               <td><%=rs.getString("contactName")%></td>
               <td><%=rs.getString("contactContents")%></td>
               <td><%=rs.getString("contactStart")%></td>   
               <td><%=rs.getString("contactEnd")%></td>  
               <td><%=rs.getString("StaffName")%></td>  
           </tr>
           <%
                }
           %>
        </table>
    </body>
</html>
