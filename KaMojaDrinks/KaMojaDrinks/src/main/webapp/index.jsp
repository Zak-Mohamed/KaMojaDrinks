<%-- 
    Document   : index.jsp
    Created on : Apr 26, 2025, 8:02:47 PM
    Author     : zak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    int cartCount = 0;
    if (cart != null) {
        for (Integer qty : cart.values()) {
            cartCount += qty;
        }
    }
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
                    <li><a href="#About">About us</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="shop.jsp">Shop</a></li>
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
<section class="top-picks">
  <h2>Top Picks</h2>
  <div class="drink-grid">

    <div class="drink-card">
      <a href="shop.jsp" class="card-link">
        <img src="images/cola.jpg" alt="Classic Cola">
        <h3>Classic Cola</h3>
        <p>The bold, fizzy favorite you know and love.</p>
      </a>
    </div>

    <div class="drink-card">
      <a href="shop.jsp" class="card-link">
        <img src="images/lemon-tea.jpg" alt="Lemon Iced Tea">
        <h3>Lemon Iced Tea</h3>
        <p>Refreshing and lightly sweetened. Perfect on a hot day.</p>
      </a>
    </div>

    <div class="drink-card">
      <a href="shop.jsp" class="card-link">
        <img src="images/cold-brew.jpg" alt="Cold Brew Coffee">
        <h3>Cold Brew Coffee</h3>
        <p>Strong, smooth, and ice-cold — a wake-up in a bottle.</p>
      </a>
    </div>

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
      

    
      <!-- Add more content sections here -->
    </main>
  <footer>
  <div class="footer-container">
    <div class="footer-top">
      <p>&copy; 2025 KaMojaDrinks. All rights reserved.</p>
    </div>
    <div class="footer-links">
      <a href="#About">About Us</a>
      <span>|</span>
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
