/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rmb
 */
@WebServlet(name = "AdminTemperatureServlet", urlPatterns = {"/adminTemperature"})
public class AdminTemperatureServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminTemperatureServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminTemperatureServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        String Temperature = (String)getServletContext().getAttribute("Temperature");
        
        if(Temperature == null ) {
            Temperature = (String)getInitParameter("Temperature");
            getServletContext().setAttribute("Temperature",Temperature);
            
        }
        out.println("<html><head><title>气温更新" + "</title></head>");
        out.println("<boby><table border=\"0\"width=\"100%\"><tr>");
        out.println("<td align=\"left\" valign=\"bottom\">");
        out.println("<h1>当前气温</h1></td></tr></table>");
        out.print("<form action=\"");
        out.println(response.encodeURL("adminTemperature"));
        out.println("\"method=\"post\">");
        out.println("当前气温（摄氏度）");
        out.println("<input type=\"text\" name=\"temperature\"" + "value=" + Temperature + ">");
        out.println("<input type=\"Submit\" name=\"btn_submit\"" + "value=\"更新\">");
        out.println("</form></boby><html>");
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
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        
        String Temperature = request.getParameter("temperature");
        getServletContext().setAttribute("Temperature",Temperature);
        out.println("<html><head><title>气温更新" + "</title></head>");
        out.println("<boby>");
        out.println("当前气温:" + Temperature + "摄氏度");
        out.println("</boby></html>");
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
