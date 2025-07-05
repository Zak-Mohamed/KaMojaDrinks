package com.kamojadrinks.models;

public class User {
    private int id;
    private String name;
    private String email;
    private String password; 
    private String county;
    private String role;

    // Constructor for creating a user from DB
    public User(int id, String name, String email, String password, String county, String role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password; // Should be null when fetching from DB
        this.county = county;
        this.role = role;
    }

    // Constructor for registration
    public User(String name, String email, String password, String county) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.county = county;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getCounty() { return county; }
    public String getRole() { return role; }

    // Setters
    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setPassword(String password) { this.password = password; }
    public void setCounty(String county) { this.county = county; }
    public void setRole(String role) { this.role = role; }
} 