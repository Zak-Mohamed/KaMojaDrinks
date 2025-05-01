package com.kamojadrinks.models;

public class Drink {
    private String drinkId;
    private String name;
    private double price;
    private int stock;

    public DrinkString drinkId, String name, double price, int stock) {
        this.drinkId = drinkId;
        this.name = name;
        this.price = price;
        this.stock = stock;
    }

    public String getDrinkId() {
        return drinkId;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public int getStock() {
        return stock;
    }

    public void reduceStock(int quantity) {
        this.stock -= quantity;
    }

    public void increaseStock(int quantity) {
        this.stock += quantity;
    }
}
