package com.mycompany.kamojadrinks.dao;

import com.mycompany.kamojadrinks.DatabaseUtil;
import com.kamojadrinks.models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.mindrot.jbcrypt.BCrypt;

public class UserDAO {

    public void registerUser(User user) throws SQLException {
        String sql = "INSERT INTO users (name, email, password_hash, county) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Hash the password before storing
            String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
            
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, hashedPassword);
            stmt.setString(4, user.getCounty());
            
            stmt.executeUpdate();
        }
    }

    public User loginUser(String email, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ?";
        User user = null;

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // User found, check password
                if (BCrypt.checkpw(password, rs.getString("password_hash"))) {
                    // Password matches, create user object
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String county = rs.getString("county");
                    String role = rs.getString("role");
                    user = new User(id, name, email, null, county, role);
                }
            }
        }
        return user; // Will be null if login fails
    }
} 