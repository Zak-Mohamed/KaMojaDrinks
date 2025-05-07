//Methods Summary for the Branch.java
addDrink()- Adds a drink to the inventory
placeOrder()- Adds an order and reduces drink stock
getBranchRevenue()-Returns the total revenue from all orders
getName()-Returns the branch name
checkStockLevels()- Prints alerts for low stock drinks
getOrders()- Returns a list of all placed orders
getInventory()-Returns a list of drinks in the inventory

//Method Summary for Customer.java
getName()- Returns the Customer's name
getCustomerID- Returns the customer's ID

//Method Summary for Drink.java
getName()- Returns the name of the drink
getPrice()- Returns the price of the Drink
getStock()- Returns the current Stock level
reduceStock(int qty)- Decreases the stock by a given quantity
addStock(int qty)- Increases the stock by a given quantity
isLowStock()-Returns true if sstock is below 5,otherwise false

//Summary for Headquarter.java
Use of Inheritance
Branch inherits functionality for managing drinks,processing orders and calculating revenue
generalFinalReport()- Prints revenue from each branch and HQ plus the overall total revenue
showAllCustomers()-Displays the names of all customers per branch including which branch they ordered from
getInventory()- Returns the HQ's inventory(inherited from Branch)

//Summary for Order.java
calculateTotal()- Calculates the sum of all drinks prices
getCustomer()- Returns the customer who placed the order
getDrinks()- Returns the list of drinks in the order
getTotal()- Returns the total price of the order

//Summary for StockManager.java
checkLowStock(List<Drink>inventory)- Prints out all drinks with stock levels that are below
restockDrink(Drink drink, int quantity)- Increases the stock of a specific drink by the specified quantity
restockAll(List<Drink>inventory,int threshold,int restockAmount)- Restores all drinks that fall below the specified  threshold with a given amount

//Workflow in Main.java
Initializing drinks
Creating branches
Adding drinks to branches
Creating customers and orders
Setting up the headquarters
Generating reports
Check low stocks
Restocking headquarters
