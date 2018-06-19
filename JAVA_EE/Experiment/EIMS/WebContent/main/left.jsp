
<%@page contentType="text/html" pageEncoding="UTF-8"%><%        request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="CCCFFF">
        <table>
            <tr>
                <td>
                    <image src="../image/t1.gif">
                </td>
            <tr/>
            <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/clientManage/lookClient.jsp" target="main">客户管理</a>
                </td>
            <tr/>
            <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/contactManage/lookContact.jsp" target="main">合同管理</a>
                </td>
           <tr/>
           <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/CSManage/lookCS.jsp" target="main">售后管理</a>
                </td> 
            <tr/>
            <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/productManage/lookProduct.jsp" target="main">产品管理</a>
                </td> 
            <tr/>
            <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/staffManage/lookStaff.jsp" target="main">员工管理</a>
                </td>
            <tr/>
            <tr>
                <td>
                    <a href="http://localhost:8080/EIMS/login.jsp?action=logout" target="_parent">退出系统</a>
                </td>
            </tr>
        </table>
    </body>
</html>
