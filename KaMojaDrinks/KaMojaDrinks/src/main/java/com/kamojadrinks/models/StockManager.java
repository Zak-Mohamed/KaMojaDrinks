
package com.kamojadrinks.models;
import java.util.List;

public class StockManager {
    public void checkLowStock(List<Drink> inventory) {
        System.out.println("Checking for low stock...");
        for (Drink drink : inventory) {
            if (drink.isLowStock()) {
                System.out.println("LOW STOCK ALERT: " + drink.getName() + " (" + drink.getStock() + " left)");
            }
        }
    }

    public void restockDrink(Drink drink, int quantity) {
        System.out.println("Restocking " + drink.getName() + " by " + quantity + " units.");
        drink.addStock(quantity);
    }

    public void restockAll(List<Drink> inventory, int threshold, int restockAmount) {
        for (Drink drink : inventory) {
            if (drink.getStock() < threshold) {
                restockDrink(drink, restockAmount);
            }
        }
    }
}



