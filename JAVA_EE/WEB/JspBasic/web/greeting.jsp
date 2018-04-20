<%-- 
    Document   : greeting
    Created on : 2018-4-18, 19:52:26
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lomboz jsp</title>
    </head>
    <body bgcolor="#FFFFFF">
        <%
            Date today=new Date();
            int h=today.getHours();
            if(h<12)response.sendRedirect("morning.jsp");
            else response.sendRedirect("afternoon.jsp");
        %>
    </body>
</html>
