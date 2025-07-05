package com.mycompany.kamojadrinks.dao;

import com.mycompany.kamojadrinks.DatabaseUtil;
import java.sql.*;
import java.util.*;

public class BranchDAO {
    public List<Branch> getAllBranches() throws SQLException {
        List<Branch> branches = new ArrayList<>();
        String sql = "SELECT id, name, location FROM branches ORDER BY name";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Branch branch = new Branch(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("location")
                );
                branches.add(branch);
            }
        }
        return branches;
    }

    // Inner class for branch model
    public static class Branch {
        private int id;
        private String name;
        private String location;
        public Branch(int id, String name, String location) {
            this.id = id;
            this.name = name;
            this.location = location;
        }
        public int getId() { return id; }
        public String getName() { return name; }
        public String getLocation() { return location; }
    }
} 