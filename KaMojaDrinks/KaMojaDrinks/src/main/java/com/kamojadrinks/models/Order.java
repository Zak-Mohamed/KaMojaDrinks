package com.kamojadrinks.models;

import java.util.List;

public class Order {
    private Customer customer;
    private List<Drink> drinks;
    private double total;

    public Order(Customer customer, List<Drink> drinks) {
        this.customer = customer;
        this.drinks = drinks;
        this.total = calculateTotal();
    }

    private double calculateTotal() {
        double sum = 0;
        for (Drink d : drinks) {
            sum += d.getPrice();
        }
        return sum;
    }

    public Customer getCustomer() {
        return customer;
    }

    public List<Drink> getDrinks() {
        return drinks;
    }

    public double getTotal() {
        return total;
    }
}