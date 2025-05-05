package com.kamojadrinks.models;

public class Drink {
    private String name;
    private double price;
    private int stock;

    public Drink(String name, double price, int stock) {
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    public String getName() { return name; }
    public double getPrice() { return price; }
    public int getStock() { return stock; }

    public void reduceStock(int quantity) {
        stock -= quantity;
    }
    public void addStock(int quantity){
        this.stock+=quantity;
    }

    public boolean isLowStock() {
        return stock < 5; 
    }
}