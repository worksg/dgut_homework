/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web_login;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Administrator
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response,String method)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        
        String fileName="register_info.txt";
        String filePath = this.getServletContext().getRealPath("/");
        String RealfilePath = filePath + fileName;
        boolean info_file = tools.isExist(RealfilePath);
        
        HttpSession session = request.getSession();
        
        PrintWriter out=response.getWriter();
        if (info_file) {
            try{
                if (method == "post") {
                    
                    String username=request.getParameter("username");
                    String userpass=request.getParameter("userpass");
                    
                    FileInputStream file = new FileInputStream(RealfilePath);
                    InputStreamReader reader = new InputStreamReader(file, "UTF-8");
                    BufferedReader bufferReadre = new BufferedReader(reader);
                    String line = null;
                    List<String> lines = new ArrayList<String>();
                    while((line = bufferReadre.readLine())!=null){  
                        lines.add(line);  
                    }  
                    bufferReadre.close();

                    if("".equals(username) || "".equals(userpass)) {
                        RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                        rd.include(request, response);
                        out.append("用户名或者密码不能为空！");
                    }else{
                        boolean login_success = false;
                        for (String oneItem : lines) {
                            String[] parts = oneItem.split("\t");
                            if(parts[0].equalsIgnoreCase(username) && parts[1].equals(userpass)) {
                                session.getServletContext().setAttribute("upload_allow",true);
                                login_success = true;
                                break;
                            }
                        }
                        if (!login_success) {
                            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                            rd.include(request, response);
                            out.append("用户名或者密码错误，请重新输入！");
                        }else {
//                            RequestDispatcher rd=request.getRequestDispatcher("index.html");
//                            rd.include(request, response);
                            fileName="index.html";
                            RealfilePath = filePath + fileName;
                            file = new FileInputStream(RealfilePath);
                            reader = new InputStreamReader(file, "UTF-8");
                            bufferReadre = new BufferedReader(reader);
                            line = null;  
                            //逐行读取文件，并输出到页面上  
                            out.write("<p>Hello "+username+"!</p>>");
                            while((line = bufferReadre.readLine())!=null){  
                            out.println(line);  
                            }  
                            bufferReadre.close(); 
                        }
                    }

                //out.printf(username);
                }else if (method=="get") {
                    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                }
            }finally{
                out.close();
            }
        }else{
            try{
                out.print("请先注册账号和密码");
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                rd.include(request, response);
            }finally {
                out.close();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response,"get");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response,"post");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
