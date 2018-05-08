<%-- 
    Document   : param
    Created on : 2018-4-24, 15:03:19
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaBean Test</title>
    </head>
    <body>
        <jsp:useBean id ="student2" scope="page" class="com.jsp.Student" />
        <jsp:setProperty name="student2" property="name" param="UserName" />
        <jsp:setProperty name="student2" property="age" param="Age" />
        <jsp:setProperty name="student2" property="major" param="Major" />
        
        <jsp:getProperty name="student2" property="name" />
        <jsp:getProperty name="student2" property="age" />
        <jsp:getProperty name="student2" property="major" />
    </body>
</html>
