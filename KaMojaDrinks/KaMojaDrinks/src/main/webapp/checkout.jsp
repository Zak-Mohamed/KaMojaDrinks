<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Checkout - Beverage Store</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <!-- Header/Nav -->
  <header>
    <nav>
      <ul>
        <li class="left"><a href="index.jsp">Home</a></li>                 
        <li><a href="#About">About us</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a class="active" href="shop.jsp">Shop</a></li>
      </ul>   
    </nav>
  </header>
  
  <!-- Checkout Page Content -->
  <main class="main-content">
    <div class="form-wrapper">
      <h2 class="form-title">Checkout</h2>
      <div id="cart-summary"></div>
      <form onsubmit="submitOrder(event)">
        <label for="name">Full Name</label>
        <input type="text" id="name" required>
        
        <label for="phone">Phone Number</label>
        <input type="text" id="phone" required>
        
        <label for="address">Delivery Address</label>
        <input type="text" id="address" required>
        
        <button type="submit">Place Order</button>
      </form>
    </div>
  </main>
  
  <!-- Footer -->
  <footer class="site-footer">
    <p>&copy; 2025 Beverage Store. All rights reserved.</p>
  </footer>
  
  <!-- Cart rendering script -->
  <script>
    const savedCart = localStorage.getItem('cart');
    console.log('Saved cart from localStorage:', savedCart); // Debug log
    
    const cart = savedCart ? JSON.parse(savedCart) : {};
    console.log('Parsed cart object:', cart); // Debug log
    
    const summaryDiv = document.getElementById('cart-summary');
    
    function renderSummary() {
      if (Object.keys(cart).length === 0) {
        summaryDiv.innerHTML = '<p>Your cart is empty. <a href="shop.jsp">Go back to shop</a></p>';
        return;
      }
      
      let html = '<h3>Order Summary</h3><ul style="list-style: none; padding: 0;">';
      let total = 0;
      
      for (const itemName in cart) {
        const item = cart[itemName];
        console.log('Processing item:', item); // Debug log
        
        // Ensure price and qty are numbers
        const price = parseFloat(item.price) || 0;
        const qty = parseInt(item.qty) || 0;
        const subtotal = qty * price;
        
        total += subtotal;
        
        html += `<li style="padding: 10px 0; border-bottom: 1px solid #eee; display: flex; justify-content: space-between;">
          <span>${item.name} x ${qty}</span>
          <span>KES ${subtotal.toFixed(2)}</span>
        </li>`;
      }
      
      html += `</ul>
        <div style="margin-top: 20px; padding-top: 20px; border-top: 2px solid #4B0082;">
          <p style="font-size: 1.2em; font-weight: bold; color: #4B0082;">
            Total: KES ${total.toFixed(2)}
          </p>
        </div>`;
      
      summaryDiv.innerHTML = html;
    }
    
    function submitOrder(e) {
      e.preventDefault();
      
      // Get form values
      const name = document.getElementById('name').value;
      const phone = document.getElementById('phone').value;
      const address = document.getElementById('address').value;
      
      // Validate cart is not empty
      if (Object.keys(cart).length === 0) {
        alert("Your cart is empty!");
        return;
      }
      
      // Here you would typically send the order to your server
      // For now, we'll just show a success message
      alert(`Order placed successfully!\n\nCustomer: ${name}\nPhone: ${phone}\nAddress: ${address}`);
      
      // Clear the cart and redirect
      localStorage.removeItem('cart');
      window.location.href = 'index.jsp';
    }
    
    // Initialize the summary display
    renderSummary();
  </script>
</body>
</html>