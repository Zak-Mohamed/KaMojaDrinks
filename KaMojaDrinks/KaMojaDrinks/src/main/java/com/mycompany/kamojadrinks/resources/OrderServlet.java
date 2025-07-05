package com.mycompany.kamojadrinks.resources;

import com.kamojadrinks.models.OrderItem;
import com.mycompany.kamojadrinks.dao.OrderDAO;
import com.mycompany.kamojadrinks.dao.DrinkDAO;
import com.mycompany.kamojadrinks.DatabaseUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.*;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private OrderDAO orderDAO;
    private DrinkDAO drinkDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
        drinkDAO = new DrinkDAO();
    }

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
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            response.sendRedirect("login.jsp?error=login_required");
            return;
        }
        try {
            // Group cart items by branch
            Map<Integer, List<OrderItem>> branchOrderItems = new HashMap<>();
        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                String key = entry.getKey(); // format: branchId:drinkName
            int qty = entry.getValue();
                String[] parts = key.split(":", 2);
                int branchId = Integer.parseInt(parts[0]);
                String drinkName = parts[1];
                int drinkId = 0;
                double price = 0;
                // Map drink name to id and price
                if (drinkName.equals("Classic Cola")) { drinkId = 1; price = 1.50; }
                else if (drinkName.equals("Lemon Iced Tea")) { drinkId = 2; price = 2.00; }
                else if (drinkName.equals("Cold Brew Coffee")) { drinkId = 3; price = 3.50; }
                OrderItem item = new OrderItem(drinkId, qty, price);
                branchOrderItems.computeIfAbsent(branchId, k -> new ArrayList<>()).add(item);
            }
            // Place an order for each branch
            for (Map.Entry<Integer, List<OrderItem>> branchEntry : branchOrderItems.entrySet()) {
                int branchId = branchEntry.getKey();
                List<OrderItem> items = branchEntry.getValue();
                com.kamojadrinks.models.Order order = new com.kamojadrinks.models.Order(userId, branchId, phone, address, items);
                orderDAO.saveOrder(order);
                // Decrement inventory for each item
                try (Connection conn = DatabaseUtil.getConnection()) {
                    for (OrderItem item : items) {
                        String updateSql = "UPDATE branch_inventory SET quantity = quantity - ? WHERE branch_id = ? AND drink_id = ? AND quantity >= ?";
                        try (PreparedStatement stmt = conn.prepareStatement(updateSql)) {
                            stmt.setInt(1, item.getQuantity());
                            stmt.setInt(2, branchId);
                            stmt.setInt(3, item.getDrinkId());
                            stmt.setInt(4, item.getQuantity());
                            stmt.executeUpdate();
                        }
                    }
                }
            }
        session.removeAttribute("cart");
        response.sendRedirect("orderSuccessfull.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("checkout.jsp?error=order_failed");
        }
    }
} 