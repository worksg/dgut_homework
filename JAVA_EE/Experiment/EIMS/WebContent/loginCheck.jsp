
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>数据处理页面</title>
    </head>
    <body>
        <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
            String userName =request.getParameter("userName");
            String password =request.getParameter("password");
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            if(userName.equals("")) {
                response.sendRedirect("login.jsp");
            }
            try{
            	Class.forName("com.mysql.jdbc.Driver");
            	String url="jdbc:mysql://192.168.14.5:3306/eims";
            	con=DriverManager.getConnection(url,"root","kali");
                st=con.createStatement();
                String query="select * from user where userName='" + userName + "'";
                rs=st.executeQuery(query);
                if(rs.next()){
                    String query2 ="select * from user where password='" + password + "'";
                    rs=st.executeQuery(query2);
                    if(rs.next()){
                        response.sendRedirect("main/main.jsp");
                    }else{
                        response.sendRedirect("login.jsp");
                    }
                 }
              }catch(Exception e){
                  e.printStackTrace();
              }finally{
                  rs.close();
                  st.close();
                  con.close();
             }
        %>
    </body>
</html>
