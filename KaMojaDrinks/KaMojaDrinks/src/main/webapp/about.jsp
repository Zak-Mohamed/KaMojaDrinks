<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>About Us</title>
  <style>
    body, h1, h2, p, ul, li {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #E6E6FA;
      color: #333;
    }

    .header {
      background-color: #9370DB;
      color: #fff;
      padding: 10px 30px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .logo img {
      height: 50px;
       width: 50px; 
       border-radius: 50%;
       object-fit: cover;
    }

    nav.menu a {
      color: purple;
      text-decoration: none;
      margin-left: 20px;
      font-weight: bold;
      transition: all 0.3s ease;
    }

    nav.menu a:hover {
      color: #1f1f1f;
      background-color: #9370DB;
      padding: 5px 10px;
      border-radius: 5px;
    }

    main.main {
      padding: 30px;
    }

    #mission-vision {
      background-color: white;
      padding: 30px;
      margin-bottom: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    #mission-vision h2 {
      color: purple;
      margin-bottom: 20px;
    }

    #mission, #vision {
      margin-bottom: 20px;
    }

    #mission h2, #vision h2 {
      margin-bottom: 10px;
      font-size: 22px;
    }

    #our-team {
      padding: 20px;
    }

    #our-team h2 {
      color: purple;
      font-size: 26px;
      margin-bottom: 20px;
    }

    .team-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 20px;
    }

    .team-member {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      box-shadow: 0 0 8px rgba(0,0,0,0.05);
      transition: transform 0.3s ease;
    }

    .team-member:hover {
      transform: translateY(-5px);
    }

    .team-member img {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 15px;
    }

    .team-member h2 {
      font-size: 20px;
      margin-bottom: 10px;
    }

    .team-member p {
      font-size: 15px;
      color: #555;
    }

    footer {
      text-align: center;
      background-color: #9370DB;
      color: purple;
      padding: 15px;
      margin-top: 30px;
    }
  </style>

  <!-- Optional Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
  <header class="header">
    <div class="logo">
      <a href="#">
        <img src="images/logo.jpg" alt="Logo">
      </a>
    </div>
    <nav class="menu">
        <a href="index.jsp"><i class="fas fa-home"></i> Home</a>
      <a href="login.jsp"><i class="fas fa-user"></i> Login</a>
      <a href="shop.jsp"><i class="fas fa-shopping-cart"></i> Shop</a>
      <a href="#"><i class="fas fa-info-circle"></i> About Us</a>
    </nav>
  </header>

  <main class="main">
    <section id="mission-vision">
      <h2>Mission and Vision</h2>
      <div id="mission">
        <h2>Our Mission</h2>
        <p>To provide customers with a seamless, affordable, 
            and satisfying online shopping experience by offering high-quality products and exceptional service.</p>
      </div>
      <div id="vision">
        <h2>Our Vision</h2>
        <p>To become a leading online retail platform known for reliability, variety, and customer-centric innovation across the region and beyond.</p>
      </div>
    </section>

    <section id="our-team">
      <h2>Our Team</h2>
      <div class="team-grid">
        <div class="team-member">
          <img src="images/profile1.jpg" alt="Patience Atieno">
          <h2>Patience Atieno</h2>
          <p>Passionate about building smooth and user-friendly online shopping systems.</p>
        </div>
          
        <div class="team-member">
          <img src="images/profile2.jpg" alt="Leo Kinara">
          <h2>Leo Kinara</h2>
          <p>Ensures the site is clean, responsive, and intuitive for users on all devices.</p>
        </div>

        <div class="team-member">
          <img src="images/profile3.jpg" alt="Brian Kikuvi">
          <h2>Brian Kikuvi</h2>
          <p>Manages product listings, inventory, and vendor partnerships to maintain quality and variety.</p>
        </div>

        <div class="team-member">
          <img src="images/profile4.jpg" alt="Zakariya Mohammed">
          <h2>Zakariya Mohammed</h2>
          <p>Handles support and feedback, ensuring customers get timely help and a personal touch.</p>
        </div>

        <div class="team-member">
          <img src="images/profile5.jpg" alt="Glen Mativo">
          <h2>Glen Mativo</h2>
          <p>Responsible for gathering requirements, analyzing business needs,
              and ensuring the system meets user expectations.</p>
        </div>
      </div>
    </section>
     
      <section id="our-story" style="background-color: #fff; padding: 30px; margin-top: 20px; border-radius: 10px; box-shadow: 0 0 10px rgba(0,0,0,0.05);">
  <h2 style="color: purple; font-size: 26px; margin-bottom: 15px;">Our Story</h2>
  <p style="font-size: 16px; line-height: 1.8; color: #444;">
    KamojaDrinks was born from a shared passion for technology, convenience, and creating something 
    that would make life easier for everyone. In 2025, five university friends, each with a unique skill in design, development, marketing, and logistics came together 
    to do this project as an Object oriented programming project.
    <br><br>
    What started as a simple idea to deliver drinks quickly evolved into a bigger mission: 
    to build a seamless online shopping experience that empowers local vendors, excites customers, 
    and embraces innovation. With no big funding and no office, just laptops and late nights, we crafted our platform with care
    one feature at a time.
    <br><br>
    Today, KamojaDrinks is more than just a name. It’s a growing community of creators, 
    shoppers, and dreamers. 
    We are proud to serve our region with a platform that reflects who we are: bold, original, and built for people.
  </p>
</section>

  </main>

  <footer>
    &copy; 2025 KamojaDrinks. All rights reserved.
  </footer>
</body>
</html>
