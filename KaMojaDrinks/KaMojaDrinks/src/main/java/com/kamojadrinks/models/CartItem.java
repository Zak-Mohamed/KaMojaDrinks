package com.kamojadrinks.models;

public class CartItem {
    private int quantity;
    private double price;
    private int branchId;

    public CartItem(int quantity, double price, int branchId) {
        this.quantity = quantity;
        this.price = price;
        this.branchId = branchId;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }

    public int getBranchId() {
        return branchId;
    }

    public void incrementQuantity() {
        this.quantity++;
    }
} 