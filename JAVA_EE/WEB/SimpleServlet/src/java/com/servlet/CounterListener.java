/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author Administrator
 */

public class CounterListener implements ServletContextListener {
    String path="";
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        CounterFile f=new CounterFile();
        //String name = sce.getServletContext().getInitParameter("CounterPath");
        String name = "Count.txt";
        path = sce.getServletContext().getRealPath("/") + name;
        try{
            String temp = f.ReadFile(path);
            System.out.println(temp);
            sce.getServletContext().setAttribute("Counter",temp);
        }catch(Exception e) {
            System.out.println(e.toString());
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        try{
            String current=(String)sce.getServletContext().getAttribute("Counter");
            CounterFile f=new CounterFile();
            f.WriteFile(path, current);
        }catch(Exception e) {
            System.out.println(e.toString());
        }
    }
}
