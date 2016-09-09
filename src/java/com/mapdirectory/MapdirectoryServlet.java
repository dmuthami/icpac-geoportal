package com.mapdirectory;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;

/**
 *
 * @author dmuthami
 */
@WebServlet(urlPatterns = {"/MapdirectoryServlet"})
public class MapdirectoryServlet extends HttpServlet {

    @EJB
    ReadJSONSessionBeanURL urlBean;

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        //Get strinbuilder
        JSONArray jSONArray = new JSONArray();
        try {

            jSONArray = readJSONArrayFromURL();
            if (jSONArray != null) {
                request.setAttribute("JSONArray", jSONArray);
            } else {
                request.setAttribute("jSONArray", "No Layers");
            }
            //Request dispatcher
            RequestDispatcher dis = request.getRequestDispatcher("/jsp/mapdirectory.jsp");
            dis.forward(request, response);
        } catch (ServletException ex) {
            Logger.getLogger(MapdirectoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(MapdirectoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NullPointerException ex) {
            Logger.getLogger(MapdirectoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        //Get strinbuilder
        JSONArray jSONArray = null;
        jSONArray = readJSONArrayFromURL();
        if (jSONArray != null) {
            request.getSession().setAttribute("JSONArray", jSONArray);
            //Request dispatcher
            RequestDispatcher dis = request.getRequestDispatcher("/jsp/mapdirectory.jsp");
            dis.forward(request, response);
//            RequestDispatcher dis = request.getRequestDispatcher("/MapDirectoryServletOutput");
//            dis.forward(request, response);
        }

    }

    public JSONArray readJSONArrayFromURL() throws NullPointerException{

        JSONArray jSONArray = null;
        try {
            jSONArray = urlBean.printGeonodeElementsURL("objects", "http://localhost/api/layers/");
        } catch (IOException ex) {
            Logger.getLogger(MapdirectoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(MapdirectoryServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        return jSONArray;
    }

}
