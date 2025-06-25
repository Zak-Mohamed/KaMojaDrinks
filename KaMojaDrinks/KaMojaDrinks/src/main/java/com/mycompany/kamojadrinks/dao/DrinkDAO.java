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
} 