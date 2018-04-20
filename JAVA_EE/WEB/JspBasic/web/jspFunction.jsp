<%-- 
    Document   : jspFunction
    Created on : Apr 19, 2018, 3:20:42 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>client protocol : <%String protocol=request.getProtocol();
        out.println(protocol);
        %>
        <br>Page path:
        <%String path = request.getServletPath();
        out.println(path);
        %>
        <br>Length:
        <%int length = request.getContentLength();
        out.println(length);
        %>
        
        <br>Method:
        <%String method = request.getMethod();
        out.println(method);
        %>
        <br>user-agent:
        <%String header1 = request.getHeader("User-Agent");
        out.println(header1);
        %>
        <br>accept:
        <%String header2 = request.getHeader("accept");
        out.println(header2);
        %>
        <br>Host:
        <%String header3 = request.getHeader("Host");
        out.println(header3);
        %>
        <br>accept-encoding:
        <%String header4 = request.getHeader("accept-encoding");
        out.println(header4);
        %>
        <br>ip:
        <%String header5 = request.getRemoteAddr();
        out.println(header5);
        %>
        <br>client name:
        <%String header6 = request.getRemoteHost();
        out.println(header6);
        %>
        <br>server name:
        <%String header7 = request.getServerName();
        out.println(header7);
        %>
        <br>server Port:
        <%int header8 = request.getServerPort();
        out.println(header8);
        %>
        <br>args name:
        <%Enumeration enum_ = request.getParameterNames();
         while(enum_.hasMoreElements()) {
             String s = (String)enum_.nextElement();
             out.println(s);
         }
        %>
        <br>header_args name:
        <%Enumeration enum_headed = request.getHeaderNames();
         while(enum_headed.hasMoreElements()) {
             String s = (String)enum_headed.nextElement();
             out.println(s);
         }
        %>
        <br>cookie:
        <%
        Enumeration enum_headedValues = request.getHeaders("cookie");
        while(enum_headedValues.hasMoreElements()) {
            String s = (String) enum_headedValues.nextElement();
            out.println(s);
        }
        %>
    </body>
</html>
