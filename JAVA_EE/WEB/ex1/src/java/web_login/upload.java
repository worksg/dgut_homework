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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "upload", urlPatterns = {"/upload"})
@MultipartConfig(location = "D:\\")
public class upload extends HttpServlet {
    
    private String fileNameExtractorRegex = "filename=\".+\"";
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String method)
            throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        boolean permission =(boolean)session.getServletContext().getAttribute("upload_allow");
        if (method == "get") {
            if (permission) {
            try (PrintWriter out = response.getWriter()) {
                String fileName="upload.html";
                String filePath = this.getServletContext().getRealPath("/");
                String RealfilePath = filePath + fileName;
                FileInputStream file = new FileInputStream(RealfilePath);
                InputStreamReader reader = new InputStreamReader(file, "UTF-8");
                BufferedReader bufferReadre = new BufferedReader(reader);
                String line = null;  
                //逐行读取文件，并输出到页面上  
                while((line = bufferReadre.readLine())!=null){  
                    out.write(line);  
                }  
                bufferReadre.close();
            }
            }else {
                response.sendRedirect("login");
            }
        }
        if (method =="post") {
            if (permission) {
                try (PrintWriter out = response.getWriter()) {
                    /* TODO output your page here. You may use following sample code. */
                    String path = this.getServletContext().getRealPath("/");
                    out.write("Upload Successfuly. <br/>");
                    for (Part p : request.getParts()) {
                        if ( p.getHeader("content-type") != null ) {
                            if(p.getContentType().contains("image")) {
                                String fname = getFileName(p);
                                p.write(path+fname);
                                //System.out.println(path);
                                //System.out.println(p.getContentType());
                            }
                        }
                    }
                    out.write("<input type=\"button\" value=\"返回主页\" onclick=\"javascript:window.location.href='/ex1/index.html'\">");
                }

                
            }else{
                response.sendRedirect("login");
            }
        }
    }
    private String getFileName(Part part) {
        String contentDecs = part.getHeader("content-disposition");
        String fileName = null;
        Pattern pattern = Pattern.compile(fileNameExtractorRegex);
        Matcher matcher = pattern.matcher(contentDecs);
        if (matcher.find()) {
            fileName = matcher.group();
            fileName = fileName.substring(10,fileName.length() - 1);
        }
        return fileName;
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
