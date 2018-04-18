<%-- 
    Document   : safe
    Created on : Apr 18, 2018, 9:12:49 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isThreadSafe="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! int number = 0;
        void countPeople() {
            int i= 0;
            double sum = 0.0;
            while(i++ < 200000) //delay time, need more bigger [disable ThreadSafe when testing]
            {
                sum += i;
            }
            number ++;
        }
        %>
        <% countPeople();%>
        <p>user : <%=number%> </p>
    </body>
</html>
