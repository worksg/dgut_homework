<%-- 
    Document   : login
    Created on : 2018-3-20, 15:24:54
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
<body>
        <form name="form" method="POST" action="register">
            <table frame="box" cellspacing="5"  align="center">
                <tr>
                    <td colspan="2" align="center"><p><h3>用户注册</h3></p></td>
                </tr>
                <tr>
                    <td><label for="username">用户名</label></td>
                    <td><input type="text" name="username" value=""/></td>
                </tr>
                <tr>
                    <td><label for="userpass">密码</label></td>
                    <td><input type="password" name="userpass" value=""/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" value="注册"
                          onclick="document.forms['form'].submit();">
                    </td>
                </tr>
                <tr> </tr>
            </table>
        </form>
    </body>
</html>