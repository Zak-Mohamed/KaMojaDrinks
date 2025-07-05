<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.kamojadrinks.dao.AdminDAO" %>
<%@ page import="com.kamojadrinks.models.StockInfo" %>
<%@ page import="com.kamojadrinks.models.PurchaseInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<%
    AdminDAO adminDAO = new AdminDAO();
    List<StockInfo> stockLevels = adminDAO.getStockLevelsPerBranch();
    List<PurchaseInfo> recentPurchases = adminDAO.getRecentPurchases();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    // Group stock levels by branch
    Map<String, List<StockInfo>> branchStockMap = new LinkedHashMap<>();
    Set<String> allDrinks = new LinkedHashSet<>();
    Set<String> allBranches = new LinkedHashSet<>();
    for (StockInfo stock : stockLevels) {
        branchStockMap.computeIfAbsent(stock.getBranchName(), k -> new ArrayList<>()).add(stock);
        allDrinks.add(stock.getDrinkName());
        allBranches.add(stock.getBranchName());
    }
    // Group purchases by branch
    Map<String, List<PurchaseInfo>> branchPurchasesMap = new LinkedHashMap<>();
    for (PurchaseInfo purchase : recentPurchases) {
        branchPurchasesMap.computeIfAbsent(purchase.getBranchName(), k -> new ArrayList<>()).add(purchase);
    }
    String restockMsg = null;
    String restockParam = request.getParameter("restock");
    if ("success".equals(restockParam)) restockMsg = "Restock successful!";
    else if ("error".equals(restockParam)) restockMsg = "Restock failed. Please try again.";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../style.css">
    <style>
        .dashboard-section {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            max-width: 800px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            text-align: left;
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .restock-btn {
            background: #4B0082;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 6px;
            cursor: pointer;
            margin-bottom: 16px;
        }
        .restock-form {
            display: none;
            background: #f9f9f9;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
    </style>
    <script>
        function toggleRestockForm() {
            var form = document.getElementById('restock-form');
            form.style.display = (form.style.display === 'none' || form.style.display === '') ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <jsp:include page="../header.jsp" />
    <div class="main-content">
        <h1 style="text-align: center;">Admin Dashboard</h1>
        <% if (restockMsg != null) { %>
            <div style="background:#e6ffe6;color:#006600;padding:12px 20px;border-radius:6px;margin:16px auto;max-width:600px;text-align:center;font-size:1.2em;"><%= restockMsg %></div>
        <% } %>
        <div class="dashboard-section">
            <button class="restock-btn" onclick="toggleRestockForm()">Restock</button>
            <form id="restock-form" class="restock-form" method="post" action="restock">
                <label for="branch">Branch:</label>
                <select name="branch" id="branch" required>
                    <% for (String branch : allBranches) { %>
                        <option value="<%= branch %>"><%= branch %></option>
                    <% } %>
                </select>
                <label for="drink" style="margin-left:16px;">Drink:</label>
                <select name="drink" id="drink" required>
                    <% for (String drink : allDrinks) { %>
                        <option value="<%= drink %>"><%= drink %></option>
                    <% } %>
                </select>
                <label for="quantity" style="margin-left:16px;">Quantity:</label>
                <input type="number" name="quantity" id="quantity" min="1" required style="width:80px;">
                <button type="submit" class="restock-btn" style="margin-left:16px;">Submit</button>
            </form>
            <h2>Stock Levels per Branch</h2>
            <% for (Map.Entry<String, List<StockInfo>> entry : branchStockMap.entrySet()) { %>
                <h3><%= entry.getKey() %></h3>
                <table>
                    <thead>
                        <tr>
                            <th>Drink</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (StockInfo stock : entry.getValue()) { %>
                            <tr>
                                <td><%= stock.getDrinkName() %></td>
                                <td><%= stock.getQuantity() %></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } %>
        </div>
        <!-- Purchases per branch -->
        <div class="dashboard-section">
            <h2>Recent Purchases Per Branch</h2>
            <% for (Map.Entry<String, List<PurchaseInfo>> entry : branchPurchasesMap.entrySet()) { 
                String branchName = entry.getKey();
                List<PurchaseInfo> purchases = entry.getValue();
                double branchTotal = 0;
            %>
                <h3><%= branchName %></h3>
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Drink</th>
                            <th>Qty</th>
                            <th>Price</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (PurchaseInfo purchase : purchases) { 
                            branchTotal += purchase.getUnitPrice() * purchase.getQuantity();
                        %>
                        <tr>
                            <td><%= purchase.getOrderId() %></td>
                            <td><%= purchase.getUserName() %></td>
                            <td><%= purchase.getDrinkName() %></td>
                            <td><%= purchase.getQuantity() %></td>
                            <td><%= String.format("%.2f", purchase.getUnitPrice()) %></td>
                            <td><%= dateFormat.format(purchase.getOrderDate()) %></td>
                        </tr>
                        <% } %>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6" style="text-align:right;font-weight:bold;">Total Sales for <%= branchName %>: KES <%= String.format("%.2f", branchTotal) %></td>
                        </tr>
                    </tfoot>
                </table>
            <% } %>
        </div>
        <!-- Combined purchases -->
        <div class="dashboard-section">
            <h2>All Recent Purchases (Combined)</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Drink</th>
                        <th>Qty</th>
                        <th>Price</th>
                        <th>Branch</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% double grandTotal = 0;
                    for (PurchaseInfo purchase : recentPurchases) {
                        grandTotal += purchase.getUnitPrice() * purchase.getQuantity();
                    %>
                        <tr>
                            <td><%= purchase.getOrderId() %></td>
                            <td><%= purchase.getUserName() %></td>
                            <td><%= purchase.getDrinkName() %></td>
                            <td><%= purchase.getQuantity() %></td>
                            <td><%= String.format("%.2f", purchase.getUnitPrice()) %></td>
                            <td><%= purchase.getBranchName() %></td>
                            <td><%= dateFormat.format(purchase.getOrderDate()) %></td>
                        </tr>
                    <% } %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="7" style="text-align:right;font-weight:bold;">Grand Total Sales: KES <%= String.format("%.2f", grandTotal) %></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

</body>
</html> 