
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>处理合同添加数据</title>
    </head>
    <body>
        <%
            String staffName=request.getParameter("staffName");
            String staffSex=request.getParameter("staffSex");
            String staffAge=request.getParameter("staffAge");
            String staffEducation=request.getParameter("staffEducation");
            String staffDepartment=request.getParameter("staffDepartment");
            String staffDate=request.getParameter("staffDate");
            String staffDuty=request.getParameter("staffDuty");
            String staffWage=request.getParameter("staffWage");
            Connection con=null;
            Statement st=null;
           try{
        	   Class.forName("com.mysql.jdbc.Driver");
        	   String url="jdbc:mysql://192.168.14.5:3306/eims";
        	   con=DriverManager.getConnection(url,"root","kali");
               st=con.createStatement();
               String sql="insert into staff(staffName,staffSex,staffAge,staffEducation,staffDepartment,staffDate,staffDuty,staffWage) values ('"+staffName+"','"+staffSex+"','"+staffAge+"','"+staffEducation+"','"+staffDepartment+"','"+staffDate+"','"+staffDuty+"','"+staffWage+"')";
               st.executeUpdate(sql);
               response.sendRedirect("http://localhost:8080/EIMS/staffManage/lookStaff.jsp");    
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
