
package com.kamojadrinks.models;
    
import java.util.List;

public class Headquarter extends Branch {
    private List<Branch> branches;

    public Headquarter(String name, List<Branch> branches) {
        super(name);
        this.branches = branches;
    }

    public void generateFinalReport() {
        double totalRevenue = 0;
        System.out.println("Final Report:");
        for (Branch branch : branches) {
            double branchRevenue = branch.getBranchRevenue();
            totalRevenue += branchRevenue;
            System.out.println("- " + branch.getName() + ": KES " + branchRevenue);
        }
        totalRevenue += getBranchRevenue();
        System.out.println("- Headquarter: KES " + getBranchRevenue());
        System.out.println("TOTAL: KES " + totalRevenue);
    }

    public void showAllCustomers() {
        for (Branch branch : branches) {
            for (Order order : branch.getOrders()) {
                System.out.println(order.getCustomer().getName() + " at " + branch.getName());
            }
        }
    }
    public List<Drink>getInventory(){
        return inventory;
    }
}
