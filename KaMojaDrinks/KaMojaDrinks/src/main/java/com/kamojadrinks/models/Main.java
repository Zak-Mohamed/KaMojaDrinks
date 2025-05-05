package com.kamojadrinks.models;
import java.util.*;

public class Main {
    public static void main(String[] args) {
        // Drinks
        Drink cola = new Drink("Coca-Cola", 100, 10);
        Drink fanta = new Drink("Fanta", 90, 6);
        Drink sprite = new Drink("Sprite", 95, 3);
        
        // Branches
        Branch nakuru = new Branch("Nakuru");
        Branch mombasa = new Branch("Mombasa");
        Branch kisumu = new Branch("Kisumu");

        // Adding drinks to branches
        nakuru.addDrink(cola);
        nakuru.addDrink(sprite);
        mombasa.addDrink(fanta);
        kisumu.addDrink(sprite);

        // Customers and orders
        Customer alice = new Customer("Alice", "C001");
        Order order1 = new Order(alice, List.of(cola, sprite));
        nakuru.placeOrder(order1);

        Customer bob = new Customer("Bob", "C002");
        Order order2 = new Order(bob, List.of(fanta));
        mombasa.placeOrder(order2);

        // Headquarter
        List<Branch> branches = List.of(nakuru, mombasa, kisumu);
        Headquarter hq = new Headquarter("Nairobi HQ", branches);

        hq.addDrink(cola); // Also selling cola at HQ
        Customer hqCustomer = new Customer("HQ Guest", "C003");
        hq.placeOrder(new Order(hqCustomer, List.of(cola)));

        // Reports
        System.out.println("\n--- Final Sales Report ---");
        hq.generateFinalReport();

        System.out.println("\n--- All Customers ---");
        hq.showAllCustomers();

        // Stock Manager
        StockManager stockManager = new StockManager();

        System.out.println("\n--- Low Stock Checks ---");
        System.out.println("Nakuru:");
        stockManager.checkLowStock(nakuru.getInventory());

        System.out.println("Mombasa:");
        stockManager.checkLowStock(mombasa.getInventory());

        System.out.println("Kisumu:");
        stockManager.checkLowStock(kisumu.getInventory());

        System.out.println("Headquarter:");
        stockManager.checkLowStock(hq.getInventory());

        // Restock low drinks in HQ
        System.out.println("\n--- Restocking HQ Inventory ---");
        stockManager.restockAll(hq.getInventory(), 5, 10);

        System.out.println("\n--- Updated Stock in HQ ---");
        for (Drink d : hq.getInventory()) {
            System.out.println(d.getName() + " now has " + d.getStock() + " units.");
        }
    }
}