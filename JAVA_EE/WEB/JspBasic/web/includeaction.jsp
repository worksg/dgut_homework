<%-- 
    Document   : includeaction
    Created on : Apr 18, 2018, 9:26:23 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>include action example</title>
    </head>
    <body>
        <p>example line</p>
        <br>
        <jsp:include page="copyright.html" flush="true" ></jsp:include>
    </body>
</html>
