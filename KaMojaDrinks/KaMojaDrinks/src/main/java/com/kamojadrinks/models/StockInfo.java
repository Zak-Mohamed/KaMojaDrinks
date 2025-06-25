package com.kamojadrinks.models;

public class StockInfo {
    private String branchName;
    private String drinkName;
    private int quantity;

    public StockInfo(String branchName, String drinkName, int quantity) {
        this.branchName = branchName;
        this.drinkName = drinkName;
        this.quantity = quantity;
    }

    public String getBranchName() {
        return branchName;
    }

    public String getDrinkName() {
        return drinkName;
    }

    public int getQuantity() {
        return quantity;
    }
} 