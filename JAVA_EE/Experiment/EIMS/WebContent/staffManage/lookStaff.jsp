
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>查询员工</title>
    </head>
    <body bgcolor="lightgreen">
        <table align="center"width="500">
            <tr>
                <td>员工查询</td>
                <td><a href="http://localhost:8080/EIMS/staffManage/addStaff.jsp">员工添加</a></td>
             </tr>
        </table>
        <br>
        <hr>
        <br>
         <table align="center"width="700"border=2" >
            <tr>
                <th colspan="8">查看员工信息</th>
            </tr>
            <tr>
                <td>姓名</td>
                <td>性别</td>
                <td>年龄</td>
                <td>学历</td>
                <td>部门</td>
                <td>入职时间</td>
                <td>职务</td>
                <td>工资</td>
            </tr>
            <%
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/eims";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql="select * from staff";
                rs=stmt.executeQuery(sql);
                while(rs.next()){
            %>                         
           <tr>
               <td><%=rs.getString("staffName")%></td>
               <td><%=rs.getString("staffSex")%></td>
               <td><%=rs.getString("staffAge")%></td>
               <td><%=rs.getString("staffEducation")%></td> 
               <td><%=rs.getString("staffDepartment")%></td>
               <td><%=rs.getString("staffDate")%></td>
               <td><%=rs.getString("staffDuty")%></td>
               <td><%=rs.getString("staffWage")%></td>
           </tr>
           <%
                }
           %>
        </table>
    </body>
</html>

