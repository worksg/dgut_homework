<%-- 
    Document   : UseJavaBean
    Created on : 2018-4-24, 14:51:46
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JabaBean Test</title>
    </head>
    <body>
        <jsp:useBean id="student1" scope="page" class="com.jsp.Student" />
        <jsp:getProperty name="student1" property="name" />
        <br>
        <%=student1.getName()%>
        <br>
        <jsp:setProperty name="student1" property="name" value="temp" />
        <br>
        <jsp:getProperty name="student1" property="name" />
        <%student1.setName("zhang");%>
        <br>
        <%=student1.getName()%>
    </body>
</html>
