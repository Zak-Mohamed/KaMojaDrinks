package com.mycompany.kamojadrinks.dao;

import com.mycompany.kamojadrinks.DatabaseUtil;
import com.kamojadrinks.models.StockInfo;
import com.kamojadrinks.models.PurchaseInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    public List<StockInfo> getStockLevelsPerBranch() throws SQLException {
        List<StockInfo> stockLevels = new ArrayList<>();
        String sql = "SELECT b.name as branch_name, d.name as drink_name, bi.quantity " +
                     "FROM branch_inventory bi " +
                     "JOIN drinks d ON bi.drink_id = d.id " +
                     "JOIN branches b ON bi.branch_id = b.id " +
                     "ORDER BY b.name, d.name";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                String branchName = rs.getString("branch_name");
                String drinkName = rs.getString("drink_name");
                int quantity = rs.getInt("quantity");
                stockLevels.add(new StockInfo(branchName, drinkName, quantity));
            }
        }
        return stockLevels;
    }

    public List<PurchaseInfo> getRecentPurchases() throws SQLException {
        List<PurchaseInfo> purchases = new ArrayList<>();
        String sql = "SELECT oi.order_id, u.name as user_name, d.name as drink_name, " +
                     "oi.quantity, oi.unit_price, b.name as branch_name, o.order_date " +
                     "FROM order_items oi " +
                     "JOIN orders o ON oi.order_id = o.id " +
                     "JOIN users u ON o.user_id = u.id " +
                     "JOIN drinks d ON oi.drink_id = d.id " +
                     "JOIN branches b ON o.branch_id = b.id " +
                     "ORDER BY o.order_date DESC LIMIT 50";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                purchases.add(new PurchaseInfo(
                    rs.getInt("order_id"),
                    rs.getString("user_name"),
                    rs.getString("drink_name"),
                    rs.getInt("quantity"),
                    rs.getDouble("unit_price"),
                    rs.getString("branch_name"),
                    rs.getTimestamp("order_date")
                ));
            }
        }
        return purchases;
    }
} 