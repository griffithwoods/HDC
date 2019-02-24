/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import BusinessClasses.DBEntry;
import Entities.Cake;
import Entities.Delivery;
import Entities.User;
import businesslogic.CakeService;
import businesslogic.DeliveryService;
import businesslogic.UserService;
import dataaccess.DeliveryJpaController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 744916
 */
public class CakeManagementServlet extends HttpServlet
{
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
            throws ServletException, IOException
    {
        CakeService cs = new CakeService();
        List<Cake> cakes = cs.getAll();
        Cake[] cakeArray = new Cake[cakes.size()];
        
        for (int i = 0; i < cakes.size(); i++) {
            cakeArray[i] = cakes.get(i);
        }
        
        
        request.setAttribute("cakes", cakeArray);
        getServletContext().getRequestDispatcher("/WEB-INF/cakemanagement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession(true);
        try {
        CakeService cs = new CakeService();
        String action = request.getParameter("action");
        if (action != null) {
            int cakeId = Integer.valueOf(request.getParameter("selectedCakeId"));
            if (action.equals("delete")) {
                cs.delete(cakeId);
                doGet(request, response);
            }
            else if (action.equals("edit")) {
                session.setAttribute("cakeId", cakeId);
                response.sendRedirect("edit");
            }
        }
        } catch (Exception e) {
            //getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
