package com.mycompany.kamojadrinks;

import com.mycompany.kamojadrinks.dao.UserDAO;
import com.kamojadrinks.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String county = request.getParameter("county");

        User newUser = new User(name, email, password, county);

        try {
            userDAO.registerUser(newUser);
            // Redirect to a success page (e.g., login page with a success message)
            response.sendRedirect("login.jsp?registration=success");
        } catch (Exception e) {
            // Handle exceptions (e.g., duplicate email)
            e.printStackTrace();
            // Redirect to registration page with an error message
            response.sendRedirect("registration.jsp?error=true");
        }
    }
} 