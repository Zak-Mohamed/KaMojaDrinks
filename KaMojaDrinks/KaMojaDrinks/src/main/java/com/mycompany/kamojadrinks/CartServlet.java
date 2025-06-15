package com.mycompany.kamojadrinks;

import com.kamojadrinks.models.Drink;
import com.kamojadrinks.models.Order;
import com.kamojadrinks.models.Customer;
import com.kamojadrinks.models.Branch;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        String action = request.getParameter("action");
        String drinkName = request.getParameter("drink");
        if ("add".equals(action)) {
            cart.put(drinkName, cart.getOrDefault(drinkName, 0) + 1);
        } else if ("remove".equals(action)) {
            cart.remove(drinkName);
        }
        session.setAttribute("cart", cart);
        System.out.println("Cart contents after add: " + cart);
        response.sendRedirect("shop.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
} 