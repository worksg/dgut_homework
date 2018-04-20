<%-- 
    Document   : el2
    Created on : 2018-4-18, 22:00:44
    Author     : root
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.AbstractCollection.*" %>
<!DOCTYPE html>
<%
    HashMap values=new HashMap();
    values.put("money","泸指今日大涨200点!");
    values.put("热点","go to moon!");
    values.put("比赛","中国足球进世界杯决赛!");
    String newscolor="blue";
    request.setAttribute("news",values);
    request.setAttribute("color",newscolor);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>el 表达式的存取符和隐含对象</title>
    </head>
    <body>
        <h1>Hello ${param.name}</h1>
        <font color="${requestScope.color}">
        <h3>
            财经:${requestScope.news.money}<br>
            热点:${requestScope.news.热点}<br>
            比赛:${requestScope.news.比赛}<br>
            其他:${requestScope.news.unknown}<br>
    </body>
</html>
