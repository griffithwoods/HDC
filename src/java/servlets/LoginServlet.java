/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import Entities.Account;
import Entities.User;
import dataaccess.AccountJpaController;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
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
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        session.setAttribute("userObj", null);
        getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
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
        HttpSession session = request.getSession();

        String userIn = request.getParameter("user");
        String passIn = request.getParameter("pass");
        Account account;
        String username;
        String password;
        int type;

        AccountJpaController ajc = new AccountJpaController();
        List<Account> accounts = new ArrayList<>();

        try
        {
            accounts = ajc.findAccountEntities();
        }
        catch (Exception ex)
        {
            request.setAttribute("errorMessage", "Could not load account list. Please contact administration.");
        }

        for (int i = 0; i < accounts.size(); i++)
        {
            username = accounts.get(i).getUsername();
            password = accounts.get(i).getPassword();

            if (username.equals(userIn) && password.equals(passIn))
            {
                account = accounts.get(i);

                if (account.getAccountStatus() == true)
                {
                    Collection<User> userList = account.getUserCollection();
                    Object[] users = userList.toArray();

                    User user = (User) users[0];
                    session.setAttribute("userObj", user);
                    getServletContext().getRequestDispatcher("/WEB-INF/mainmenu.jsp").forward(request, response);
                }
            }
            else
            {
                request.setAttribute("errorMessage", "Invalid Username/Password");
                getServletContext().getRequestDispatcher("/WEB-INF/mainmenu.jsp").forward(request, response);
            }
        }
    }
}
