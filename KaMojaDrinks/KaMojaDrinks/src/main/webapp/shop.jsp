<%-- 
    Document   : shop
    Created on : Jun 9, 2025, 12:13:07 AM
    Author     : leoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
      <ul>
        <li class="left"><a class="active" href="index.jsp">Home</a></li>                 
        <li><a href="#About">About us</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="shop.jsp">Shop</a></li>
      </ul>   
    </nav>
  </header>

  <!-- Shop Section -->
  <main>
    <section class="shop">
      <h2>Shop Our Drinks</h2>
      <div class="drink-grid">
        
        <!-- Sample Drink Cards -->
        <div class="drink-card">
          <img src="images/cola.jpg" alt="Classic Cola">
          <h3>Classic Cola</h3>
          <p class="price">199</p>
          <p>The bold, fizzy favorite you know and love.</p>
          <button class="btn">Add to Cart</button>
        </div>

        <div class="drink-card">
          <img src="images/lemon-tea.jpg" alt="Lemon Iced Tea">
          <h3>Lemon Iced Tea</h3>
          <p class="price">249</p>
          <p>Refreshing and lightly sweetened. Perfect on a hot day.</p>
          <button class="btn">Add to Cart</button>
        </div>

        <div class="drink-card">
          <img src="images/cold-brew.jpg" alt="Cold Brew Coffee">
          <h3>Cold Brew Coffee</h3>
          <p class="price">299</p>
          <p>Strong, smooth, and ice-cold — a wake-up in a bottle.</p>
          <button class="btn">Add to Cart</button>
        </div>

        <!-- Add more drink-card blocks as needed -->

      </div>
    </section>
  </main>

  <!-- Cart Icon (moved outside of main content) -->
  <div id="cart-icon">
    🛒 <span id="cart-count">0</span>
  </div>

  <!-- Cart Modal (moved outside of main content) -->
  <div id="cart-modal" class="hidden">
    <div class="cart-content">
      <h2>Your Cart</h2>
      <ul id="cart-items"></ul>
      <p id="cart-total">Total: KES 0</p>
      <button id="checkout-btn">Proceed to Checkout</button>
      <button id="close-cart" style="background: #666; margin-top: 10px;">Close</button>
    </div>
  </div>

  <!-- Footer -->
  <footer class="site-footer">
    <p>&copy; 2025 Beverage Store. All rights reserved.</p>
  </footer>

  <!-- Script -->
  <script>
    const cart = {};
    const savedCart = localStorage.getItem('cart');
    if (savedCart) {
      try {
        Object.assign(cart, JSON.parse(savedCart));
      } catch (e) {
        console.error('Error parsing saved cart:', e);
      }
    }

    const cartItemsEl = document.getElementById('cart-items');
    const cartTotalEl = document.getElementById('cart-total');
    const cartCountEl = document.getElementById('cart-count');
    const cartModal = document.getElementById('cart-modal');
    const cartIcon = document.getElementById('cart-icon');
    const closeCartBtn = document.getElementById('close-cart');

    function updateCart() {
      cartItemsEl.innerHTML = '';
      let total = 0;
      let count = 0;

      for (const name in cart) {
        const item = cart[name];
        const subtotal = item.price * item.qty;
        total += subtotal;
        count += item.qty;

        const li = document.createElement('li');
        li.innerHTML = `
          <span>${item.name} x ${item.qty} — KES ${subtotal.toFixed(2)}</span>
          <button class="remove-btn" onclick="removeFromCart('${name}')">X</button>
        `;
        cartItemsEl.appendChild(li);
      }

      cartTotalEl.textContent = `Total: KES ${total.toFixed(2)}`;
      cartCountEl.textContent = count;
      
      try {
        localStorage.setItem('cart', JSON.stringify(cart));
      } catch (e) {
        console.error('Error saving cart:', e);
      }
    }

    function addToCart(name, price) {
      if (cart[name]) {
        cart[name].qty += 1;
      } else {
        cart[name] = { name, price, qty: 1 };
      }
      updateCart();
    }

    function removeFromCart(name) {
      if (cart[name]) {
        cart[name].qty -= 1;
        if (cart[name].qty <= 0) {
          delete cart[name];
        }
      }
      updateCart();
    }

    // Add event listeners to drink cards
    document.querySelectorAll('.drink-card').forEach(card => {
      const button = card.querySelector('.btn');
      button.addEventListener('click', (e) => {
        e.stopPropagation();
        const name = card.querySelector('h3').textContent;
        const priceText = card.querySelector('.price').textContent;
        // Parse price as KES (remove any non-numeric characters except decimal point)
        const price = parseFloat(priceText.replace(/[^0-9.]/g, '')) || 0;
        addToCart(name, price);
        
        // Show feedback
        button.textContent = 'Added!';
        button.style.background = '#27ae60';
        setTimeout(() => {
          button.textContent = 'Add to Cart';
          button.style.background = '';
        }, 1000);
      });
    });

    // Cart icon click handler
    cartIcon.addEventListener('click', () => {
      cartModal.classList.toggle('hidden');
    });

    // Close cart button
    closeCartBtn.addEventListener('click', () => {
      cartModal.classList.add('hidden');
    });

    // Close cart when clicking outside
    cartModal.addEventListener('click', (e) => {
      if (e.target === cartModal) {
        cartModal.classList.add('hidden');
      }
    });

    // Checkout button
    document.getElementById('checkout-btn').addEventListener('click', () => {
      if (Object.keys(cart).length === 0) {
        alert('Your cart is empty!');
        return;
      }
      
      localStorage.setItem('cart', JSON.stringify(cart));
      window.location.href = 'checkout.jsp';
    });

    // Initialize cart display
    updateCart();
  </script>

</body>
</html>