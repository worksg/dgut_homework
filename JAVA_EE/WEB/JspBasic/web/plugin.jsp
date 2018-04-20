<%-- 
    Document   : plugin
    Created on : Apr 19, 2018, 3:12:45 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equivm="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:plugin type="applet" code="Circle.class" >
            <jsp:fallback>
                Plugin tag OBJECT or EMBED not supported  by browser
            </jsp:fallback>
        </jsp:plugin>
    </body>
</html>
