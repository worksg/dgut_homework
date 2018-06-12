
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>处理客户添加数据</title>
    </head>
    <body>
        <%
            String productName=request.getParameter("productName");
            String productModel=request.getParameter("productModel");
            String productNumber=request.getParameter("productNumber");
            String productPrice=request.getParameter("productPrice");
            Connection con=null;
            Statement st=null;
           try{
        	   Class.forName("com.mysql.jdbc.Driver");
        	   String url="jdbc:mysql://192.168.14.5:3306/eims";
        	   con=DriverManager.getConnection(url,"root","kali");
               st=con.createStatement();
               String sql="insert into product(productName,productModel,productNumber,productPrice) values ('"+productName+"','"+productModel+"','"+productNumber+"','"+productPrice+"')";
               st.executeUpdate(sql);
               response.sendRedirect("http://localhost:8080/EIMS/productManage/lookProduct.jsp");    
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
