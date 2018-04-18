<%-- 
    Document   : testError
    Created on : Apr 18, 2018, 9:09:14 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>testError</title>
    </head>
    <body>
        <%! int[] a= {1,2,3}; %>
        <%=a[3]%>
    </body>
</html>
