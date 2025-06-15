<%-- 
    Document   : shop
    Created on : Jun 9, 2025, 12:13:07 AM
    Author     : leoki
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

  <!-- Shop Section -->
  <main>
    <section class="shop">
      <h2 style="text-align:center;color:#4B0082;font-size:2.2em;margin-bottom:24px;">Shop Our Drinks</h2>
      <div class="drink-grid" style="display:flex;justify-content:center;gap:32px;flex-wrap:wrap;">
        
        <!-- Sample Drink Cards -->
        <div class="drink-card">
          <img src="images/cola.jpg" alt="Classic Cola">
          <h3>Classic Cola</h3>
          <p class="price">199</p>
          <p>The bold, fizzy favorite you know and love.</p>
          <form method="post" action="cart" style="display:inline; margin:0; padding:0;">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="drink" value="Classic Cola">
            <button type="submit" class="btn" style="width:100%; margin-top:10px;">Add to Cart</button>
          </form>
        </div>

        <div class="drink-card">
          <img src="images/lemon-tea.jpg" alt="Lemon Iced Tea">
          <h3>Lemon Iced Tea</h3>
          <p class="price">249</p>
          <p>Refreshing and lightly sweetened. Perfect on a hot day.</p>
          <form method="post" action="cart" style="display:inline; margin:0; padding:0;">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="drink" value="Lemon Iced Tea">
            <button type="submit" class="btn" style="width:100%; margin-top:10px;">Add to Cart</button>
          </form>
        </div>

        <div class="drink-card">
          <img src="images/cold-brew.jpg" alt="Cold Brew Coffee">
          <h3>Cold Brew Coffee</h3>
          <p class="price">299</p>
          <p>Strong, smooth, and ice-cold — a wake-up in a bottle.</p>
          <form method="post" action="cart" style="display:inline; margin:0; padding:0;">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="drink" value="Cold Brew Coffee">
            <button type="submit" class="btn" style="width:100%; margin-top:10px;">Add to Cart</button>
          </form>
        </div>

        <!-- Add more drink-card blocks as needed -->

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