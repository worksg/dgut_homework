<%-- 
    Document   : Attribute_receive
    Created on : 2018-4-18, 19:23:26
    Author     : rmb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lomboz JSP</title>
    </head>
    <body bgcolor="#FFFFFF">
        <%
        String name=(String)request.getAttribute("name");
        java.util.ArrayList content=new ArrayList();
        content=(java.util.ArrayList)request.getAttribute("value");
        int m =0;
        String promt="";
        if(content!=null)
        {
            String temp=(String)content.get(1);
            m=Integer.parseInt(temp);
            promt=(String)content.get(0);
        }
        for(int i=0;i<m;i++){
        %>
        <%=promt+" "+name%>
        <br>
        <%}%>
    </body>
</html>
