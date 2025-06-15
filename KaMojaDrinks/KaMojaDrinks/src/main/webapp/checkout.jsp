%-- 
    Document   : index.jsp
    Created on : Apr 26, 2025, 8:02:47 PM
    Author     : zak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%
    Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
    int cartCount = 0;
    if (cart != null) {
        for (Integer qty : cart.values()) {
            cartCount += qty;
        }
    }
%>
<!DOCTYPE html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Checkout - Beverage Store</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <!-- Header/Nav -->
  <header>
    <nav>
      <ul style="display:flex;align-items:center;justify-content:center;gap:32px;list-style:none;padding:0;margin:0;">
        <li class="left"><a href="index.jsp">Home</a></li>                 
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
  <!-- Checkout Page Content -->
  <main class="main-content">
    <div class="form-wrapper" style="max-width:600px;margin:40px auto;background:#fff;padding:32px 40px 32px 40px;border-radius:12px;box-shadow:0 4px 24px #e0e0e0;">
      <h2 class="form-title" style="text-align:center;color:#4B0082;margin-bottom:24px;">Checkout</h2>
      <div id="cart-summary">
        <h3 style="color:#4B0082;">Order Summary</h3>
        <% 
          if (cart == null || cart.isEmpty()) {
        %>
          <div style="padding:20px;text-align:center;">Your cart is empty. <a href="shop.jsp">Go back to shop</a></div>
        <% } else { %>
          <table style="width:100%;border-collapse:collapse;margin-bottom:24px;">
            <thead>
              <tr style="background:#f3e6ff;color:#4B0082;">
                <th style="padding:10px 6px;text-align:left;">#</th>
                <th style="padding:10px 6px;text-align:left;">Product</th>
                <th style="padding:10px 6px;text-align:right;">Qty</th>
                <th style="padding:10px 6px;text-align:right;">Price</th>
                <th style="padding:10px 6px;text-align:right;">Subtotal</th>
              </tr>
            </thead>
            <tbody>
            <% int i=1; int total=0;
               for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                  String name = entry.getKey();
                  int qty = entry.getValue();
                  int price = 0;
                  if (name.equals("Classic Cola")) price = 199;
                  else if (name.equals("Lemon Iced Tea")) price = 249;
                  else if (name.equals("Cold Brew Coffee")) price = 299;
                  int subtotal = qty * price;
                  total += subtotal;
            %>
              <tr style="border-bottom:1px solid #eee;">
                <td style="padding:8px 6px;"><%= i++ %></td>
                <td style="padding:8px 6px;"><%= name %></td>
                <td style="padding:8px 6px;text-align:right;"><%= qty %></td>
                <td style="padding:8px 6px;text-align:right;">KES <%= price %></td>
                <td style="padding:8px 6px;text-align:right;">KES <%= subtotal %></td>
              </tr>
            <% } %>
            </tbody>
            <tfoot>
              <tr style="background:#f3e6ff;font-weight:bold;">
                <td colspan="4" style="padding:10px 6px;text-align:right;">Total:</td>
                <td style="padding:10px 6px;text-align:right;color:#4B0082;">KES <%= total %></td>
              </tr>
            </tfoot>
          </table>
        <% } %>
      </div>
      <form method="post" action="order" style="margin-top:32px;">
        <label for="name" style="display:block;margin-bottom:6px;color:#4B0082;font-weight:bold;">Full Name</label>
        <input type="text" id="name" name="name" required style="width:100%;padding:10px;margin-bottom:18px;border-radius:6px;border:1px solid #ccc;">
        <label for="phone" style="display:block;margin-bottom:6px;color:#4B0082;font-weight:bold;">Phone Number</label>
        <input type="text" id="phone" name="phone" required style="width:100%;padding:10px;margin-bottom:18px;border-radius:6px;border:1px solid #ccc;">
        <label for="address" style="display:block;margin-bottom:6px;color:#4B0082;font-weight:bold;">Delivery Address</label>
        <input type="text" id="address" name="address" required style="width:100%;padding:10px;margin-bottom:24px;border-radius:6px;border:1px solid #ccc;">
        <button type="submit" style="width:100%;background:#4B0082;color:#fff;padding:14px 0;font-size:1.1em;border:none;border-radius:6px;cursor:pointer;">Place Order</button>
      </form>
    </div>
  </main>
  
  <!-- Footer -->
  <footer class="site-footer">
    <p>&copy; 2025 Beverage Store. All rights reserved.</p>
  </footer>
</body>
</html>