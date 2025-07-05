package com.mycompany.kamojadrinks.dao;

import com.mycompany.kamojadrinks.DatabaseUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.StringJoiner;
import java.util.ArrayList;
import java.util.List;

public class DrinkDAO {

    public Map<String, Integer> getDrinkIdsByNames(Set<String> drinkNames) throws SQLException {
        if (drinkNames == null || drinkNames.isEmpty()) {
            return new HashMap<>();
        }

        Map<String, Integer> drinkIdMap = new HashMap<>();
        StringJoiner joiner = new StringJoiner("','", "('", "')");
        drinkNames.forEach(joiner::add);

        String sql = "SELECT id, name FROM drinks WHERE name IN " + joiner.toString();

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                drinkIdMap.put(rs.getString("name"), rs.getInt("id"));
            }
        }
        return drinkIdMap;
    }

    // New: Get drinks and their quantities for a specific branch
    public List<BranchDrink> getDrinksForBranch(int branchId) throws SQLException {
        List<BranchDrink> drinks = new ArrayList<>();
        String sql = "SELECT d.id, d.name, d.price, d.image_url, IFNULL(bi.quantity, 0) as quantity " +
                     "FROM drinks d " +
                     "LEFT JOIN branch_inventory bi ON d.id = bi.drink_id AND bi.branch_id = ? ";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, branchId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    drinks.add(new BranchDrink(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                    ));
                }
            }
        }
        return drinks;
    }

    public static class BranchDrink {
        private int id;
        private String name;
        private double price;
        private String imageUrl;
        private int quantity;
        public BranchDrink(int id, String name, double price, String imageUrl, int quantity) {
            this.id = id;
            this.name = name;
            this.price = price;
            this.imageUrl = imageUrl;
            this.quantity = quantity;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public double getPrice() { return price; }
        public String getImageUrl() { return imageUrl; }
        public int getQuantity() { return quantity; }
    }
} 