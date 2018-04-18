<%-- 
    Document   : statement_vary
    Created on : Apr 18, 2018, 8:27:45 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>变量声明</title>
    </head>
    <body>
        <%i++;%>
        <p> user : <%=i%> </p>
        <%! int i=0;%>
    </body>
</html>
