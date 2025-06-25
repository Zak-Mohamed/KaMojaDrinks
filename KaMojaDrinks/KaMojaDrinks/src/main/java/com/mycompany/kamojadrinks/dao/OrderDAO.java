package com.mycompany.kamojadrinks.dao;

import com.mycompany.kamojadrinks.DatabaseUtil;
import com.kamojadrinks.models.Order;
import com.kamojadrinks.models.OrderItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OrderDAO {

    public void saveOrder(Order order) throws SQLException {
        String orderSQL = "INSERT INTO orders (user_id, branch_id, phone, delivery_address) VALUES (?, ?, ?, ?)";
        String itemSQL = "INSERT INTO order_items (order_id, drink_id, quantity, unit_price) VALUES (?, ?, ?, ?)";

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            // Start transaction
            conn.setAutoCommit(false);

            // Insert into orders table
            try (PreparedStatement orderStmt = conn.prepareStatement(orderSQL, Statement.RETURN_GENERATED_KEYS)) {
                orderStmt.setInt(1, order.getUserId());
                orderStmt.setInt(2, order.getBranchId());
                orderStmt.setString(3, order.getPhone());
                orderStmt.setString(4, order.getDeliveryAddress());
                orderStmt.executeUpdate();

                // Get the generated order ID
                try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int orderId = generatedKeys.getInt(1);

                        // Insert into order_items table
                        try (PreparedStatement itemStmt = conn.prepareStatement(itemSQL)) {
                            for (OrderItem item : order.getItems()) {
                                itemStmt.setInt(1, orderId);
                                itemStmt.setInt(2, item.getDrinkId());
                                itemStmt.setInt(3, item.getQuantity());
                                itemStmt.setDouble(4, item.getUnitPrice());
                                itemStmt.addBatch();
                            }
                            itemStmt.executeBatch();
                        }
                    } else {
                        throw new SQLException("Creating order failed, no ID obtained.");
                    }
                }
            }

            // Commit transaction
            conn.commit();

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw e;
        } finally {
            if (conn != null) {
                try {
                    conn.setAutoCommit(true);
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
} 