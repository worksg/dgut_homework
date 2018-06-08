<%@page contentType="text/html" pageEncoding="UTF-8"  import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <%
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");//设置语言编码格式
        %>
        <title>查询条件</title>
    </head>
    <body>

        <%
            java.sql.Connection conn = null;
            java.lang.String strConn;
            java.sql.PreparedStatement preparedStmt = null; //语句对象 
            java.sql.ResultSet sqlRst = null; //结果集对象 
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(
                        "jdbc:mysql://192.168.14.5:3306/sample", "root", "kali");
                preparedStmt = conn.prepareStatement("select customerid,firstname,lastname,address from customer where FirstName like ?  or LastName like ?");
                //设置参数
                String parm = request.getParameter("parm");
                System.out.println("条件为: " + parm);
                preparedStmt.setString(1, "%" + parm + "%");//条件中有中文仍然有问题
                preparedStmt.setString(2, "%" + parm + "%");
                //执行Sql语句 
                sqlRst = preparedStmt.executeQuery();
        %>
    <center>顾客信息表</center>
    <table border="1" width="100%" bordercolorlight="#CC99FF" cellpadding="2" bordercolordark="#FFFFFF" cellspacing="0"> 
        <tr> 
            <td align="center">ID</td> 
            <td align="center">地址</td> 
            <td align="center">姓名</td> 
        </tr> 
        <% while (sqlRst.next()) { //取得下一条记录
                String name = sqlRst.getString("firstname");
                name += "  " + sqlRst.getString("lastname");
        %> 
        <tr><!--显示记录--> 
            <td><%=sqlRst.getString("customerid")%></td> 
            <td><%=sqlRst.getString("address")%></td> 
            <td><%=name%></td> 
        </tr> 
        <% } %> 
    </table> 
    <%
        } catch (java.sql.SQLException e) {
            out.println(e.toString());
        } finally {
            //关闭结果集对象
            if (sqlRst != null) {
                try {
                    sqlRst.close();
                } catch (java.sql.SQLException e1) {
                    out.println(e1.toString());
                } finally {
                    try {
                        //关闭语句对象
                        if (preparedStmt != null) {
                            preparedStmt.close();
                        }
                    } catch (java.sql.SQLException e2) {
                        out.println(e2.toString());
                    } finally {
                        try {
                            //关闭数据库连接
                            if (conn != null) {
                                conn.close();
                            }
                        } catch (java.sql.SQLException e3) {
                            out.println(e3.toString());
                        }
                    }
                }
            }

        }
    %>
</body>
</html>