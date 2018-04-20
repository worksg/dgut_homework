<%-- 
    Document   : Attribute_send
    Created on : 2018-4-18, 19:15:13
    Author     : rmb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lomboz JSP</title>
    </head>
    <body bgcolor="#FFFFFF">
        <% ArrayList ar = new ArrayList();
        String he="hello";
        ar.add(he);
        int m=3;
        ar.add(Integer.toString(m));
        request.setAttribute("name","peter");
        request.setAttribute("value",ar);
        %>
        <h3>Attribute传递参数示例</h3>
        <jsp:forward page="Attribute_receive.jsp"></jsp:forward>
    </body>
</html>
