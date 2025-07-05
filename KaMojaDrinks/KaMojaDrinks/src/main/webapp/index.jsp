<%-- 
    Document   : index.jsp
    Created on : Apr 26, 2025, 8:02:47 PM
    Author     : zak
--%>

<%
if (request.getAttribute("branches") == null) {
    response.sendRedirect("branches");
    return;
}
%>
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
    List<com.mycompany.kamojadrinks.dao.BranchDAO.Branch> branches = (List<com.mycompany.kamojadrinks.dao.BranchDAO.Branch>) request.getAttribute("branches");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" type="text/css" href="./style.css">
    </head>
   <body>
        <header>
            <nav>
                <ul style="display:flex;align-items:center;justify-content:center;gap:32px;list-style:none;padding:0;margin:0;">
                    <li class="left"><a class="active" href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About us</a></li>
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
         <main class="main-content">
      <!-- Hero / Banner -->
      <section class="hero">
    <img src="images/purplehero.png" alt="Hero Background">
    <div class="hero-content">
        <h1>Quality refreshments for you</h1>
        <p>Quench your thirst with our wide array of drinks!</p>
        <a href="#contact">Get Started</a>
    </div>
</section>

<section class="how-it-works">
    <h2>How It Works</h2>
    <div class="steps">
        <div class="step">
            <h3>1. Browse & Select</h3>
            <p>Explore our wide range of beverages and pick your favorites.</p>
        </div>
        <div class="step">
            <h3>2. Place Your Order</h3>
            <p>Quick and secure checkout, online or cash on delivery.</p>
        </div>
        <div class="step">
            <h3>3. Get It Delivered</h3>
            <p>Fresh, chilled drinks delivered right to your door.</p>
        </div>
    </div>
</section>
      
            <section class="branches">
                <h2 style="text-align:center;color:#4B0082;font-size:2.2em;margin-bottom:24px;">Choose a Branch</h2>
                <div style="display:flex;justify-content:center;gap:32px;flex-wrap:wrap;">
                <% if (branches != null) {
                    for (com.mycompany.kamojadrinks.dao.BranchDAO.Branch branch : branches) { %>
                        <div class="branch-card" style="background:#fff;padding:24px 32px;border-radius:12px;box-shadow:0 2px 8px #ccc;text-align:center;min-width:220px;">
                            <h3><%= branch.getName() %> <span style="color:#888;font-size:0.8em;">(Branch #<%= branch.getId() %>)</span></h3>
                            <p style="color:#666;"><%= branch.getLocation() %></p>
                            <a href="shop?branch_id=<%= branch.getId() %>" style="display:inline-block;margin-top:12px;padding:10px 24px;background:#4B0082;color:#fff;border-radius:6px;text-decoration:none;">Shop at <%= branch.getName() %></a>
                        </div>
                <%  } 
                } %>
                </div>
            </section>

    
      <!-- Add more content sections here -->
    </main>
  <footer>
  <div class="footer-container">
    <div class="footer-top">
      <p>&copy; 2025 KaMojaDrinks. All rights reserved.</p>
    </div>
    <div class="footer-links">
      <a href="#Contact">Contact</a>
      <span>|</span>
      <a href="registration.jsp">Register</a>
      <span>|</span>
      <a href="login.jsp">Login</a>
    </div>
  </div>
</footer>

    </body>
    
</html>
