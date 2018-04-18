<%-- 
    Document   : statement_class
    Created on : Apr 18, 2018, 8:40:01 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>declarative class</title>
    </head>
    <body>
        <%! public class sayHello{
            boolean country;
            sayHello(boolean country) {this.country=country;}
            String Hello(){
            if(country) return "Hello";
            else return "World";
            }
        }%>
        <% sayHello a =new sayHello(false);%>
        <%=a.Hello()%>
    </body>
</html>
