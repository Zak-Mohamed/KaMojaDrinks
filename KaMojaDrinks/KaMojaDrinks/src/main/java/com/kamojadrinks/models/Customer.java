package com.kamojadrinks.models;

public class Customer {
    private String name;
    private String customerID;

    public Customer(String name, String customerID) {
        this.name = name;
        this.customerID = customerID;
    }

    public String getName() { return name; }
    public String getCustomerID() { return customerID; }
}