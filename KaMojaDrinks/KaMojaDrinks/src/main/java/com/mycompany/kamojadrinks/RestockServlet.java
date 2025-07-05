package com.mycompany.kamojadrinks;

import com.mycompany.kamojadrinks.DatabaseUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/admin/restock")
public class RestockServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String branchName = request.getParameter("branch");
        String drinkName = request.getParameter("drink");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        try (Connection conn = DatabaseUtil.getConnection()) {
            // Look up branch_id
            int branchId = 0;
            try (PreparedStatement stmt = conn.prepareStatement("SELECT id FROM branches WHERE name = ?")) {
                stmt.setString(1, branchName);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) branchId = rs.getInt(1);
                }
            }
            // Look up drink_id
            int drinkId = 0;
            try (PreparedStatement stmt = conn.prepareStatement("SELECT id FROM drinks WHERE name = ?")) {
                stmt.setString(1, drinkName);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) drinkId = rs.getInt(1);
                }
            }
            if (branchId == 0 || drinkId == 0) throw new Exception("Invalid branch or drink");
            // Update or insert into branch_inventory
            int updated = 0;
            try (PreparedStatement stmt = conn.prepareStatement("UPDATE branch_inventory SET quantity = quantity + ? WHERE branch_id = ? AND drink_id = ?")) {
                stmt.setInt(1, quantity);
                stmt.setInt(2, branchId);
                stmt.setInt(3, drinkId);
                updated = stmt.executeUpdate();
            }
            if (updated == 0) {
                try (PreparedStatement stmt = conn.prepareStatement("INSERT INTO branch_inventory (branch_id, drink_id, quantity) VALUES (?, ?, ?);")) {
                    stmt.setInt(1, branchId);
                    stmt.setInt(2, drinkId);
                    stmt.setInt(3, quantity);
                    stmt.executeUpdate();
                }
            }
            response.sendRedirect("dashboard.jsp?restock=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?restock=error");
        }
    }
} 