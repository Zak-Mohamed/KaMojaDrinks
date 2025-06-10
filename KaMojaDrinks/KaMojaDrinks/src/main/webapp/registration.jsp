<%-- 
    Document   : registration.jsp
    Created on : Jun 6, 2025, 8:26:18 PM
    Author     : leoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link rel="stylesheet" type="text/css" href="./style.css">
  </head>
  <body>
        <form action="submit-form.php" method="post">
        <legend class="form-title">Sign Up</legend>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="county">County:</label>
        <input list="county-options" id="county" name="county" required>      
        <datalist id="county-options">
            <option value="Nairobi">
            <option value="Mombasa">
            <option value="Kisumu">
        </datalist>
      <button type="submit">Sign Up</button>
    </form>
  </body>
</html>
