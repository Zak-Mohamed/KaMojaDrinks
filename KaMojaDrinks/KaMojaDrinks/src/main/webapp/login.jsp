<%-- 
    Document   : login.jsp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>Login - BeverageOrder</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <div class="page-container">
        <div class="main-content">
            <div class="form-wrapper">
                <%
                    String username = (String) session.getAttribute("username");
                    if (username == null) {
                %>
                <!-- Login Form -->
                <form class="form-login" method="post" action="login">
                    <h2 class="form-title">Sign In</h2>
                    
                    <% if (request.getParameter("error") != null) { %>
                        <div class="alert">
                            <p>❌ Invalid email or password</p>
                        </div>
                    <% } %>
                    <% if (request.getParameter("error") != null && request.getParameter("error").equals("login_required")) { %>
                        <div class="alert">
                            <p>❌ Please login to place an order</p>
                        </div>
                    <% } %>

                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Enter your email" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password" required>

                    <button type="submit">Login</button>
                </form>

                <p class="center-text">Don't have an account? <a href="registration.jsp">Register here</a></p>
                <% } else { %>
                <!-- Logged In View -->
                <form class="form-login" method="post" action="logout">
                    <h2 class="form-title">Welcome, <%= username %>!</h2>
                    <button type="submit">Logout</button>
                </form>
                <% } %>
            </div>
        </div>

        
    </div>
</body>
</html>
