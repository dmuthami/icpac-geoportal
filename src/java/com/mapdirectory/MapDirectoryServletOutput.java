/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mapdirectory;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dmuthami
 */
@WebServlet(name = "MapDirectoryServletOutput", urlPatterns = {"/MapDirectoryServletOutput"})
public class MapDirectoryServletOutput extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Browse Maps | ICPAC</title>");
            
            out.println("<link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/font-awesome.min.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/prettyPhoto.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/animate.min.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/main.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/responsive.css\" rel=\"stylesheet\">");
            out.println("<link href=\"css/mapdirectory.css\" rel=\"stylesheet\" type=\"text/css\"/>");
            out.println("<link href=\"css/mapdirectorylist.css\" rel=\"stylesheet\" type=\"text/css\"/>");
            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
           
            out.println("<div id=\"mainContainer\" class=\"container\">");
            out.println("<div id=\"tableView\" class=\"row search-results\">");
            
              StringBuilder sb = (StringBuilder) request.getSession().getAttribute("sb");
            if (sb == null) {
                out.println("Parsing the JSON object wasnt successful");
            } else {
                out.println("<p>"+sb+"</p>");
            }         
            
            out.println("</div>");
            out.println("</div>");
            

            out.println("</body>");
            out.println("</html>");
        }

    }

    public void mapDirectoryDivs() {

    }

}
