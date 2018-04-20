<%-- 
    Document   : application
    Created on : 2018-4-18, 21:23:51
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>application对象示例</title>
    </head>
    <body>
        <%
            out.println("java servlet api version " + application.getMajorVersion() + "." + application.getMinorVersion() + "<br>");
            out.println("application.jsp's MIME type is：" + application.getMimeType("application.jsp") + "<br>");
            out.println("url of 'application.jsp' is:" + application.getResource("/application.jsp") + "<br>");
            out.println("getServerInfo()=" + application.getServerInfo() + "<br>");
            out.println(application.getRealPath("application.jsp"));
            application.log("add a record to log_file");
        %>
    </body>
</html>
