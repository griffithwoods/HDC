package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 744916
 */
public class RegisterServlet extends HttpServlet
{
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
        getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
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
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String postalCode = request.getParameter("postal");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Boolean errorCheck = false;
        if(username.equals(""))
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Username");
        }
        if(password.equals("") || password.length() > 30)
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter a Password");
        }
        if(name.equals("") || name.length() > 25)
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Full Name");
        }
        if(address.equals(""))
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Full Address");
        }
        if(postalCode.equals(""))
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Postal Code");
        }
        if(email.equals(""))
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Email");
        }
        if(phone.equals(""))
        {
            errorCheck = true;
            request.setAttribute("error", "Please Enter Your Phone Number");
        }
        if(errorCheck)
        {
            getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
        else
        {
            try {
                //Get highest user_id from db
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/capstonedb","root", "password");
                String prepStatement = "Select MAX(user_id) from user;";
                PreparedStatement ps = connection.prepareStatement(prepStatement);
                ResultSet rs = ps.executeQuery();
                
                //Create Insert statement
                String prepInsertUser = "Insert Into User(user_id,name,address,postal_code,email,phone_no,account_type,username,password,account_status) Values(?,?,?,?,?,?,?,?,?,?);";

                //Get highest account number.
                rs.next();
                int user_id = rs.getInt(1);
                user_id++;
                
                //Add user input into prepared statement.
                ps = connection.prepareStatement(prepInsertUser);
                ps.setInt(1, user_id);
                ps.setString(2, name);
                ps.setString(3, address);
                ps.setString(4, postalCode);
                ps.setString(5, email);
                ps.setString(6, phone);
                ps.setInt(7, 1);
                ps.setString(8, username);
                ps.setString(9, password);
                ps.setInt(10, 1);
                //Insert user into user table.
                ps.executeUpdate();
                
                //Confirm to user that they have been registered.
                request.setAttribute("status", "Registration Complete! Please login to begin");
                getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
