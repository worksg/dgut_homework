<%@page language="java" contentType="application/x-msdownload"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ page import="java.io.*"%>
<% 

    String filepath = this.getServletContext().getRealPath("/");
    String filename = "JSF2.0-hello-world-example-2.1.7.zip";
    response.setContentType("APPLICATION/OCTET-STREAM");
    response.setHeader("Content-Disposition", "attachment; filename=\""
            + filename + "\"");

    FileInputStream fileInputStream = new FileInputStream(filepath + filename);

    int i;
    while ((i = fileInputStream.read()) != -1) {
        out.write(i);
    }
    fileInputStream.close();
%>
