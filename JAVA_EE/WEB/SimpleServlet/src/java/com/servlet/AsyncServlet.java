/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "AsyncServlet", urlPatterns = {"/AsyncServlet"},asyncSupported = true)
public class AsyncServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("org.apache.catalina.ASYNC_SUPPORTED", true); //new line code
        PrintWriter out = response.getWriter();
        /* TODO output your page here. You may use following sample code. */
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet AsyncServlet</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("进入Servlet时间:"+new Date() + ".");
        out.flush();
        AsyncContext ctx = request.startAsync();
        new Thread(new Executor(ctx)).start();
        out.println("<br>");
        out.println("结束Servlet时间:"+new Date() + ".");
//            out.println("</body>");
//            out.println("</html>");
        out.flush();
    }
    public class Executor implements Runnable {
        private AsyncContext ctx = null;
        public Executor(AsyncContext ctx) {
            this.ctx = ctx;
        }
        
        @Override
        public void run() {
            try{
                //wait 30s, 模拟业务方法的执行
                Thread.sleep(30000);
                PrintWriter out = ctx.getResponse().getWriter();
                out.println("<br>");
                out.println("业务处理完毕的时间:"+new Date()+".");
                out.flush();
                ctx.complete();
            }catch(Exception e ) {
                e.printStackTrace();
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
