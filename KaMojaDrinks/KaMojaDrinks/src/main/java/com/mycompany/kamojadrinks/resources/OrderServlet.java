package com.mycompany.kamojadrinks.resources;

import com.kamojadrinks.models.Customer;
import com.kamojadrinks.models.Order;
import com.kamojadrinks.models.Drink;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("checkout.jsp");
            return;
        }
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = new Customer(name, phone); // Use phone as ID for now
        List<Drink> drinks = new ArrayList<>();
        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
            String drinkName = entry.getKey();
            int qty = entry.getValue();
            int price = 0;
            if (drinkName.equals("Classic Cola")) price = 199;
            else if (drinkName.equals("Lemon Iced Tea")) price = 249;
            else if (drinkName.equals("Cold Brew Coffee")) price = 299;
            for (int i = 0; i < qty; i++) {
                drinks.add(new Drink(drinkName, price, 1));
            }
        }
        Order order = new Order(customer, drinks);
        // For now, just print order details
        System.out.println("Order placed: " + order.getCustomer().getName() + " - " + drinks.size() + " drinks.");
        // TODO: Save order to DB or in-memory list
        session.removeAttribute("cart");
        response.sendRedirect("orderSuccessfull.jsp");
    }
} 