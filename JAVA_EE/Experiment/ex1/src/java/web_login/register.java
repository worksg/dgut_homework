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
import static java.lang.String.format;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "register", urlPatterns = {"/register"})
public class register extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        if (method == "post" ) {
            
            String userName = request.getParameter("username");
            System.out.println("username："+userName);

            String userPass = request.getParameter("userpass");
            System.out.println("userpass："+userPass);
            
            PrintWriter out=response.getWriter();
            try{
                /* TODO output your page here. You may use following sample code. */
                if (userName != "" && userPass != ""){
                    
                    String fileName="register_info.txt";
                    String filePath = this.getServletContext().getRealPath("/");
                    String RealfilePath = filePath + fileName;
                    FileInputStream file = new FileInputStream(RealfilePath);
                    InputStreamReader reader = new InputStreamReader(file, "UTF-8");
                    BufferedReader bufferReader = new BufferedReader(reader);
                    String line = null;
                    List<String> lines = new ArrayList<String>();
                    while((line = bufferReader.readLine())!=null){  
                        lines.add(line);  
                    }  
                    bufferReader.close();
                    
                    boolean repeat = false;
                    for (String oneItem : lines) {
                        String[] parts = oneItem.split("\t");
                        if(parts[0].equalsIgnoreCase(userName)){
                            repeat = true;
                            break;
                        }
                    }
                    if (!repeat) {
                        String record_info = format("%s\t%s\n",userName,userPass);
                        //System.out.println(record_info);
                        tools.write(RealfilePath,record_info);
                        response.sendRedirect("login");
                    }else {                  
                        RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                        rd.include(request, response);
                        out.append("用户名已存在！请重新填写用户名");
                    }
                }else{
                    RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                    rd.include(request, response);
                    out.append("用户名或者密码不能为空！");
                }
            }finally{
                out.close();
            }
        }else if (method == "get") {
            PrintWriter out=response.getWriter();
            try{
                /* TODO output your page here. You may use following sample code. */
                RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
                rd.include(request, response);
            }finally{
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
