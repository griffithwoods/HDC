/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Entities.Cake;
import businesslogic.CakeService;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 744916
 */
public class CartServlet extends HttpServlet
{

    private boolean emptyCart = true;

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
        HttpSession session = request.getSession();
        String language = (String) session.getAttribute("language");

        ArrayList<Integer> cakes = (ArrayList<Integer>) session.getAttribute("cakes");

        if (cakes != null && cakes.size() != 0)
        {
            double totalPrice = 0;
            CakeService cs = new CakeService();
            List<Cake> allCakes = cs.getAll();
            int cakeArraySize = allCakes.get(allCakes.size()-1).getCakeId() + 1;
            
            int[] counter = new int[cakeArraySize];

            //todo: Make add quantity
            //For da prices
            for (int i = 0; i < cakes.size(); i++)
            {
                totalPrice = totalPrice + cs.get(cakes.get(i)).getPrice();
            }
            emptyCart = false;
            
            
//            use cakeArray[a] to store the unique cake of cakeId a
//            use counter[a] to save the qty for cakeArray[a]
            Cake[] cakeArray = new Cake[cakeArraySize];

            for (int i = 0; i < cakes.size(); i++)
            {
                int a = cakes.get(i);
                if (cakeArray[a] == null)
                {
                    cakeArray[a] = cs.get(a);
                    counter[a] = 1;
                }
                else
                {
                    counter[a]++;
                }
            }
            
//            set totalPrice two digits after decimal
            totalPrice = Double.valueOf(new DecimalFormat("#.00").format(totalPrice));
            
            request.setAttribute("counter", counter);
            request.setAttribute("cakesInCart", cakeArray);
            request.setAttribute("totalPrice", totalPrice);
            
            //put totalPrice in session, paypal will pay this number
            session.setAttribute("totalPrice", totalPrice);
            ArrayList<Cake> cakes2 = (ArrayList<Cake>) session.getAttribute("cakes");
        }
        else
        {
            emptyCart = true;
            //set totalprice=0
            double totalPrice = 0;
            request.setAttribute("totalPrice", totalPrice);

            request.setAttribute("errorMessage", "Your cart is empty");
        }

//        getServletContext().getRequestDispatcher("/WEB-INF/cart.jsp").forward(request, response);
        if (language == null)
        {
            language = "en";
        }
        if (language.equals("cn"))
        {
            getServletContext().getRequestDispatcher("/WEB-INF/cn/cart.jsp").forward(request, response);
        }
        else
        {
            getServletContext().getRequestDispatcher("/WEB-INF/en/cart.jsp").forward(request, response);
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
            throws ServletException, IOException
    {
        String action = request.getParameter("action");
        if (action != null)
        {
            if (action.equals("delete"))
            {
                HttpSession session = request.getSession(true);
                int selectedCakeId = Integer.valueOf(request.getParameter("selectedCake"));
                int delQuantity = Integer.valueOf(request.getParameter("delQuantity"));
                ArrayList<Integer> cakes = (ArrayList<Integer>) session.getAttribute("cakes");

                Iterator iterator = cakes.iterator();

                while ((iterator.hasNext()) && (delQuantity > 0))
                {
                    if (iterator.next().equals(selectedCakeId))
                    {
                        iterator.remove();
                        delQuantity--;
                    }
                }

                doGet(request, response);
            }else if(action.equals("change")){
                HttpSession session = request.getSession(true);
                int selectedCakeId = Integer.valueOf(request.getParameter("selectedCake"));
                int newQuantity = Integer.parseInt(request.getParameter("quantity"));
                ArrayList<Integer> cakes = (ArrayList<Integer>) session.getAttribute("cakes");

                 Iterator iterator = cakes.iterator();

                while (iterator.hasNext())
                {
                    if (iterator.next().equals(selectedCakeId))
                    {
                        iterator.remove();
                    }
                }
                 
                //add quanty of selectedcakeid
                for(int i=0;i<newQuantity;i++){
                    cakes.add(selectedCakeId);
                }
                session.setAttribute("cakes", cakes);
                doGet(request, response);
            }
        }
        
        
        if (emptyCart == false)
        {
            response.sendRedirect("orderdetails");
        }
        else
        {
            response.sendRedirect("cart");
        }
    }
}
