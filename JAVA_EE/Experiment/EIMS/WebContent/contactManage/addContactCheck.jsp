
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
        <title>处理合同添加数据</title>
    </head>
    <body>
        <%
            String clientName=request.getParameter("clientName");
            String contactName=request.getParameter("contactName");
            String contactContents=request.getParameter("contactContents");
            String contactStart=request.getParameter("contactStart");
            String contactEnd=request.getParameter("contactEnd");
            String StaffName=request.getParameter("StaffName");
            Connection con=null;
            Statement st=null;
           try{
        	   Class.forName("com.mysql.jdbc.Driver");
        	   String url="jdbc:mysql://192.168.14.5:3306/eims";
        	   con=DriverManager.getConnection(url,"root","kali");
               st=con.createStatement();
               String sql="insert into contact(clientName,contactName,contactContents,contactStart,contactEnd,StaffName) values ('"+clientName+"','"+contactName+"','"+contactContents+"','"+contactStart+"','"+contactEnd+"','"+StaffName+"')";
               st.executeUpdate(sql);
               response.sendRedirect("http://localhost:8080/EIMS/contactManage/lookContact.jsp");    
           }
           catch(Exception e){
               e.printStackTrace();
           }
           finally{
              st.close();
              con.close();
           }
        %>
    </body>
</html>
