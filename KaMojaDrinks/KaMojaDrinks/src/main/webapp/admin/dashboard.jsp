<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.mycompany.kamojadrinks.dao.AdminDAO" %>
<%@ page import="com.kamojadrinks.models.StockInfo" %>
<%@ page import="com.kamojadrinks.models.PurchaseInfo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    AdminDAO adminDAO = new AdminDAO();
    List<StockInfo> stockLevels = adminDAO.getStockLevelsPerBranch();
    List<PurchaseInfo> recentPurchases = adminDAO.getRecentPurchases();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
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
    </style>
</head>
<body>
    <jsp:include page="../header.jsp" />

    <div class="main-content">
        <h1 style="text-align: center;">Admin Dashboard</h1>

        <div class="dashboard-section">
            <h2>Stock Levels per Branch</h2>
            <table>
                <thead>
                    <tr>
                        <th>Branch</th>
                        <th>Drink</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (StockInfo stock : stockLevels) { %>
                        <tr>
                            <td><%= stock.getBranchName() %></td>
                            <td><%= stock.getDrinkName() %></td>
                            <td><%= stock.getQuantity() %></td>
                        </tr>
                    <% } %>
                    <% if (stockLevels.isEmpty()) { %>
                        <tr>
                            <td colspan="3" style="text-align: center;">No stock information available.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="dashboard-section">
            <h2>Recent Purchases</h2>
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
                    <% for (PurchaseInfo purchase : recentPurchases) { %>
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
                    <% if (recentPurchases.isEmpty()) { %>
                        <tr>
                            <td colspan="7" style="text-align: center;">No recent purchases found.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

</body>
</html> 