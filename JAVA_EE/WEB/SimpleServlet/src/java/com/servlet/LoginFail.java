/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator Sg
 */
@WebServlet(name = "LoginFail", urlPatterns = {"/LoginFail"})
public class LoginFail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();

            try {
                /* TODO output your page here. You may use following sample code. */
                out.println("<html>");
                out.println("<head>");
                out.println("<title>登录失败</title>");            
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>登录失败，请重新登录···</h1>");
                
                //中文乱码解决,文件读取方式错误,以UTF-8编码读取才正确获取HTML文本
                String fileName="login.html";
                String filePath = this.getServletContext().getRealPath("/");
                String RealfilePath = filePath + fileName;
                FileInputStream file = new FileInputStream(RealfilePath);
                InputStreamReader reader = new InputStreamReader(file, "UTF-8");
                BufferedReader bufferReadre = new BufferedReader(reader);
                String line = null;  
                //逐行读取文件，并输出到页面上  
                while((line = bufferReadre.readLine())!=null){  
                out.println(line);  
                }  
                bufferReadre.close();  
                    
//                RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
//                dispatcher.include(request, response);
                
                out.println("</body>");
                out.println("</html>");
            }finally{
                out.flush();
                out.close();
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

        processRequest(request, response);
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
        processRequest(request, response);
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
