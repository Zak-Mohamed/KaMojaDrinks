
package com.kamojadrinks.models;

 import java.util.ArrayList;
import java.util.List;
public class Branch {
    protected String name;
    protected List<Drink> inventory = new ArrayList<>();
    protected List<Order> orders = new ArrayList<>();

    public Branch(String name) {
        this.name = name;
    }

    public void addDrink(Drink drink) {
        inventory.add(drink);
    }

    public void placeOrder(Order order) {
        orders.add(order);
        for (Drink d : order.getDrinks()) {
            d.reduceStock(1);
        }
    }

    public double getBranchRevenue() {
        double total = 0;
        for (Order o : orders) {
            total += o.getTotal();
        }
        return total;
    }

    public String getName() { return name; }

    public void checkStockLevels() {
        for (Drink d : inventory) {
            if (d.isLowStock()) {
                System.out.println("ALERT: Low stock on " + d.getName() + " in " + name);
            }
        }
    }

    public List<Order> getOrders() {
        return orders;
    }
    public List<Drink>getInventory(){
        return inventory;
    }
}

