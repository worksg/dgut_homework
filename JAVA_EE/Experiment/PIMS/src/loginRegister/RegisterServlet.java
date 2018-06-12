/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package loginRegister;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

public class RegisterServlet extends HttpServlet {
    public void wrong1(){
        String msg="不允许有空，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong2(){
        String msg="两次密码不同，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void wrong3(){
        String msg="用户名已存在，注册失败！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
    public void right(){
        String msg="注册信息合格，注册成功！";
        int type=JOptionPane.YES_NO_CANCEL_OPTION;
        String title="信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	response.setCharacterEncoding("UTF-8");
        String userName=request.getParameter("userName");
        String password1=request.getParameter("password1");
        String password2=request.getParameter("password2");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String birth=request.getParameter("year")+"-"+request.getParameter("mouth")+"-"+request.getParameter("day");
        String nation=request.getParameter("nation");
        String edu=request.getParameter("edu");
        String work=request.getParameter("work");
        String phone=request.getParameter("phone");
        String place=request.getParameter("place");
        String email=request.getParameter("email");
        if(userName.length()==0||password1.length()==0||password2.length()==0||name.length()==0||phone.length()==0||email.length()==0){
            wrong1();
            response.sendRedirect("http://localhost:8080/PIMS/register/register.jsp");
        }else if(!(password1.equals(password2))){
            wrong2();
            response.sendRedirect("http://localhost:8080/PIMS/register/register.jsp");
        }else{
            try{
                Connection con=null;
                Statement stmt=null;
                ResultSet rs=null;
                Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://192.168.14.5:3306/person";
                con=DriverManager.getConnection(url,"root","kali");
                stmt=con.createStatement();
                String sql1="select * from user where userName='"+userName+"'";
                rs=stmt.executeQuery(sql1);
                rs.last();
                int k;
                k=rs.getRow();
                if(k>0){
                    wrong3();
                    response.sendRedirect("http://localhost:8080/PIMS/register/register.jsp");
                }else{
                    String sql2="insert into user"+"(userName,password,name,sex,birth,nation,edu,work,phone,place,email)"+"values("+"'"+userName+"'"+","+"'"+password1+"'"+","+"'"+name+"'"+","+"'"+sex+"'"+","+"'"+birth+"'"+","+"'"+nation+"'"+","+"'"+edu+"'"+","+"'"+work+"'"+","+"'"+phone+"'"+","+"'"+place+"'"+","+"'"+email+"'"+")";
                    stmt.executeUpdate(sql2);
                }
                rs.close();
                stmt.close();
                con.close();
                right();
                response.sendRedirect("http://localhost:8080/PIMS/login.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

   
}
