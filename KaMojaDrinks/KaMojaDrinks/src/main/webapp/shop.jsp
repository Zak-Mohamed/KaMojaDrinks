<%-- 
    Document   : shop
    Created on : Jun 9, 2025, 12:13:07 AM
    Author     : leoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    int cartCount = 0;
    if (cart != null) {
        for (Integer qty : cart.values()) {
            cartCount += qty;
        }
    }
    List<com.mycompany.kamojadrinks.dao.DrinkDAO.BranchDrink> drinks = (List<com.mycompany.kamojadrinks.dao.DrinkDAO.BranchDrink>) request.getAttribute("drinks");
    com.mycompany.kamojadrinks.dao.BranchDAO.Branch branch = (com.mycompany.kamojadrinks.dao.BranchDAO.Branch) request.getAttribute("branch");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Shop - Beverage Store</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>

  <!-- Header/Nav -->
  <header>
    <nav>
      <ul style="display:flex;align-items:center;justify-content:center;gap:32px;list-style:none;padding:0;margin:0;">
        <li class="left"><a class="active" href="index.jsp">Home</a></li>                 
        <li><a href="shop.jsp">Shop</a></li>
        <% if (session.getAttribute("userName") != null) { %>
            <li><a href="shop.jsp">Shop</a></li>
            <li><a href="logout">Logout (<%= session.getAttribute("userName") %>)</a></li>
            <% if ("admin".equals(session.getAttribute("userRole"))) { %>
                <li><a href="admin/dashboard.jsp">Admin Dashboard</a></li>
            <% } %>
        <% } else { %>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="shop.jsp">Shop</a></li>
        <% } %>
        <li>
          <a href="checkout.jsp" style="position:relative;">
            🛒 Cart <span style="background:#4B0082;color:#fff;border-radius:50%;padding:2px 8px;font-size:0.9em;position:relative;top:-2px;left:2px;">
              <%= cartCount %>
            </span>
          </a>
        </li>
      </ul>   
    </nav>
  </header>

  <!-- Shop Section -->
  <main>
    <section class="shop">
      <h2 style="text-align:center;color:#4B0082;font-size:2.2em;margin-bottom:24px;">
        Shop at <%= branch != null ? branch.getName() : "Branch" %>
      </h2>
      <div class="drink-grid" style="display:flex;justify-content:center;gap:32px;flex-wrap:wrap;">
        <% if (drinks != null && !drinks.isEmpty()) {
            for (com.mycompany.kamojadrinks.dao.DrinkDAO.BranchDrink drink : drinks) { %>
        <div class="drink-card">
                <img src="<%= drink.getImageUrl() != null ? drink.getImageUrl() : "images/cola.jpg" %>" alt="<%= drink.getName() %>">
                <h3><%= drink.getName() %></h3>
                <p class="price"><%= drink.getPrice() %></p>
                <p>Available: <%= drink.getQuantity() %></p>
          <form method="post" action="cart" style="display:inline; margin:0; padding:0;">
            <input type="hidden" name="action" value="add">
                  <input type="hidden" name="drink" value="<%= drink.getName() %>">
                  <input type="hidden" name="branch_id" value="<%= branch != null ? branch.getId() : 1 %>">
                  <button type="submit" class="btn" style="width:100%; margin-top:10px;" <%= drink.getQuantity() == 0 ? "disabled" : "" %>>Add to Cart</button>
          </form>
        </div>
        <%  } 
          } else { %>
            <div style="padding:20px;text-align:center;">No drinks available for this branch.</div>
        <% } %>
      </div>
    </section>
  </main>

  <!-- Add a prominent Checkout button below the drink grid -->
  <div style="text-align:center; margin: 30px 0;">
    <a href="checkout.jsp" style="background:#4B0082;color:#fff;padding:12px 32px;border-radius:6px;text-decoration:none;font-size:1.2em;box-shadow:0 2px 8px #ccc;">Proceed to Checkout 🛒</a>
  </div>

  <!-- Footer -->
  <footer class="site-footer">
    <p>&copy; 2025 Beverage Store. All rights reserved.</p>
  </footer>

</body>
</html>