package com.kamojadrinks.models;

public class OrderItem {
    private int id;
    private int orderId;
    private int drinkId;
    private int quantity;
    private double unitPrice;

    // Constructor, Getters, and Setters
    public OrderItem(int drinkId, int quantity, double unitPrice) {
        this.drinkId = drinkId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public int getDrinkId() { return drinkId; }
    public void setDrinkId(int drinkId) { this.drinkId = drinkId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getUnitPrice() { return unitPrice; }
    public void setUnitPrice(double unitPrice) { this.unitPrice = unitPrice; }
} 