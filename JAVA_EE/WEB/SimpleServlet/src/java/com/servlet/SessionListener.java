/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author Administrator
 */
@WebListener
public class SessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String current = (String)se.getSession().getServletContext().getAttribute("online");
        if(current == null)
            current="0";
        int c = Integer.parseInt(current);
        c++;
        current = String.valueOf(c);
        se.getSession().getServletContext().setAttribute("online",current);
        
        String his = (String)se.getSession().getServletContext().getAttribute("Counter");
        if(his==null)
            his="0";
        int total = Integer.parseInt(his)+1;
        his = String.valueOf(total);
        se.getSession().getServletContext().setAttribute("Counter",his);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String current = (String)se.getSession().getServletContext().getAttribute("online");
        if(current==null)
            current = "0";
        int c = Integer.parseInt(current);
        c--;
        current = String.valueOf(c);
        se.getSession().getServletContext().setAttribute("online",current);
    }
}
