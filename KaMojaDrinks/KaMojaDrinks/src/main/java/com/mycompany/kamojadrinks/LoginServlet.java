package com.mycompany.kamojadrinks;

import com.kamojadrinks.models.CartItem;
import com.mycompany.kamojadrinks.dao.UserDAO;
import com.kamojadrinks.models.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            User user = userDAO.loginUser(email, password);

            if (user != null) {
                // Login successful, migrate cart and create new session
                HttpSession oldSession = request.getSession(false);
                Map<String, CartItem> cart = null;
                if (oldSession != null) {
                    cart = (Map<String, CartItem>) oldSession.getAttribute("cart");
                    oldSession.invalidate();
                }

                HttpSession newSession = request.getSession(true);
                newSession.setAttribute("userId", user.getId());
                newSession.setAttribute("userName", user.getName());
                newSession.setAttribute("userRole", user.getRole());
                
                if (cart != null) {
                    newSession.setAttribute("cart", cart);
                }

                // Redirect based on role
                if ("admin".equals(user.getRole())) {
                    response.sendRedirect("admin/dashboard.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                // Login failed
                response.sendRedirect("login.jsp?error=true");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=true");
        }
    }
} 