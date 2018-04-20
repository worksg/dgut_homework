<%-- 
    Document   : getParam
    Created on : 2018-4-17, 16:53:54
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        你好!
        <%!String Name;%>
        <%
            request.setCharacterEncoding("utf-8");
            Name =request.getParameter("UserName");
            String stars=new String("你喜欢吃的水果有:");
            String[] paramValues=request.getParameterValues("checkbox1");
            for(int i=0;i<paramValues.length;i++)stars+=paramValues[i] +" ";
        %>
        <%=Name%>
        <br>
        <%=stars%>
    </body>
</html>
