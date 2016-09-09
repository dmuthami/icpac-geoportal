<%-- 
    Document   : contact
    Created on : Sep 1, 2016, 1:06:55 PM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="net.icpac.Model.Mail"%>
<%
    
    Mail mail=new Mail();
    String json =mail.sendMail();
    out.print(json);
    out.flush();
%>