<%-- 
    Document   : add
    Created on : Apr 18, 2018, 10:02:04 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% String start = request.getParameter("start");
        String end = request.getParameter("end");
        int s = Integer.parseInt(start);
        int e = Integer.parseInt(end);
        int sum=0;
        for (int i=s;i<=e;i++){
         sum += i;
         
        }
        %>
        <p>from <%=start%> to <%=end%> </p>
        <br>
        <p>the sum: <%=sum%> </p>
    </body>
</html>
