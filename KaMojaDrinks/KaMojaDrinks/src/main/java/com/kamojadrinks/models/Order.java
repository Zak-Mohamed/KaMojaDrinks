package com.kamojadrinks.models;

import java.util.List;
import java.util.ArrayList;

public class Order {
    private Customer customer;
    private List<Drink> drinks;
    private double total;
    private int userId;
    private int branchId;
    private String phone;
    private String deliveryAddress;
    private List<OrderItem> items;

    public Order(Customer customer, List<Drink> drinks) {
        this.customer = customer;
        this.drinks = drinks;
        this.total = calculateTotal();
        this.items = new ArrayList<>();
        // Convert drinks to order items
        for (Drink drink : drinks) {
            this.items.add(new OrderItem(0, 1, drink.getPrice())); // drinkId will be set later
        }
    }

    // Constructor for web orders
    public Order(int userId, int branchId, String phone, String deliveryAddress, List<OrderItem> items) {
        this.userId = userId;
        this.branchId = branchId;
        this.phone = phone;
        this.deliveryAddress = deliveryAddress;
        this.items = items;
        this.total = calculateTotalFromItems();
    }

    private double calculateTotal() {
        double sum = 0;
        for (Drink d : drinks) {
            sum += d.getPrice();
        }
        return sum;
    }

    private double calculateTotalFromItems() {
        double sum = 0;
        for (OrderItem item : items) {
            sum += item.getUnitPrice() * item.getQuantity();
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

    // New methods for web orders
    public int getUserId() {
        return userId;
    }

    public int getBranchId() {
        return branchId;
    }

    public String getPhone() {
        return phone;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }
}