<%-- 
    Document   : JavaBeanScope
    Created on : 2018-4-24, 15:25:21
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JavaBean Test</title>
    </head>
    <body>
        <jsp:useBean id="student3" scope="session" class="com.jsp.Student" />
        <%-- <jsp:useBean id="student3" scope="page" class="com.jsp.Student" /> --%>

        <%=student3.getName()%>
        <%student3.setName("temp");%>
    </body>
</html>
