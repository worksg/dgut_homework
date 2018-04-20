<%-- 
    Document   : logcheck
    Created on : 2018-4-18, 20:06:15
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String promt=new String();
        String Name=request.getParameter("UserName");
        boolean hasLog=false;
        ArrayList names=(ArrayList)session.getAttribute("lognames");
        if(names==null)
        {
            names=new ArrayList();
            names.add(Name);
            session.setAttribute("lognames",names);
            promt="欢迎登陆！您的名字已经写入session";
        }else{
            for(int i=0;i<names.size();i++)
            {
                String temp=(String)names.get(i);
                if(temp.equals(Name))
                {
                    promt="您已经登陆";
                    hasLog=true;
                    break;
                }
            }
            
            if(!hasLog)
            {
                names.add(Name);
                session.setAttribute("lognames",names);
                promt="欢迎登陆！您的名字已经写入session";
            }
        }
        %>
        <br>
        <%=promt%>
    </body>
</html>
