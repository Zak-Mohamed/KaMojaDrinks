package com.kamojadrinks.models;

import java.sql.Timestamp;

public class PurchaseInfo {
    private int orderId;
    private String userName;
    private String drinkName;
    private int quantity;
    private double unitPrice;
    private String branchName;
    private Timestamp orderDate;

    public PurchaseInfo(int orderId, String userName, String drinkName, int quantity, double unitPrice, String branchName, Timestamp orderDate) {
        this.orderId = orderId;
        this.userName = userName;
        this.drinkName = drinkName;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.branchName = branchName;
        this.orderDate = orderDate;
    }

    // Getters
    public int getOrderId() { return orderId; }
    public String getUserName() { return userName; }
    public String getDrinkName() { return drinkName; }
    public int getQuantity() { return quantity; }
    public double getUnitPrice() { return unitPrice; }
    public String getBranchName() { return branchName; }
    public Timestamp getOrderDate() { return orderDate; }
} 