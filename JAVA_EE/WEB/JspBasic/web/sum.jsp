<%-- 
    Document   : sum
    Created on : 2018-4-18, 18:55:45
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body><font size="5">
        <%long sum=0;
        String s1=request.getParameter("sum");
        String s2=request.getParameter("n");
        if(s1==null)
        {
            s1="";
        }
        if(s2==null)
        {
            s2="";
        }
        if(s1.equals("1"))
        {
            int n = Integer.parseInt(s2);
            for(int i =0;i<=n;i++)
            {
                sum=sum+i;
            }
        }else if(s1.equals("2"))
        {
            int n = Integer.parseInt(s2);
            for(int i =0;i<=n;i++)
            {
                sum=sum+i*i;
            }
        }else if(s1.equals("2"))
        {
            int n = Integer.parseInt(s2);
            for(int i =0;i<=n;i++)
            {
                sum=sum+i*i*i;
            }
        }
        %>
        <p>您的求和结果是<%=sum%>
    </body>
</html>
