<%-- 
    Document   : counter
    Created on : 2018-4-18, 21:36:03
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>网页计算器</title>
    </head>
    <body>
        <%
            if(application.getAttribute("counter")==null)
            application.setAttribute("counter","1");
            else
            {
                String times=null;
                times=application.getAttribute("counter").toString();
                int icount=0;
                icount=Integer.valueOf(times).intValue();
                icount++;
                application.setAttribute("counter",Integer.toString(icount));
            }
        %>
        您是第<%=application.getAttribute("counter")%>位访问者
    </body>
</html>
