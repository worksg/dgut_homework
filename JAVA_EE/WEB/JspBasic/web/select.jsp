<%-- 
    Document   : select
    Created on : 2018-4-17, 17:04:42
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
        <font size=5>
    <form action="sum.jsp"method="post" name="form">
           <p>选择计算方式
               <select name="sum"size=2>
                <Option Selectd value ="1">计算1到n的连续和
                <Option value ="2">计算1到n的平方和
                <Option value ="3">计算1到n的立方和
            </select>
           <p>选择n的值:
                <select name="n">
                <option value="10">n=10
                <option value="20">n=20
                <option value="30">n=30
                <option value="40">n=40
                <option value="50">n=50
                <option value="100">n=100
               </select>
               <br><br>
               <input type="submit"value="提交"name="submit">
    </form>
    </body>
</html>
