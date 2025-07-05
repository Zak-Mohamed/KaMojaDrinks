        <%-- 
    Document   : header.jsp
    Created on : Jun 4, 2025, 11:04:20 AM
    Author     : leoki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String uri = request.getRequestURI();
    String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Header</title>
        <link rel="stylesheet" type="text/css" href="<%= context %>/style.css">
    </head>
    <body>
        <header>
            <nav>
             <ul style="background:black;">
  <li class="left"><a class="<%= uri.endsWith("branches") ? "active" : "" %>" href="<%= context %>/branches">Branches</a></li>
  <li><a class="<%= uri.endsWith("index.jsp") ? "active" : "" %>" href="<%= context %>/index.jsp">Home</a></li>
  <li><a class="<%= uri.contains("about.jsp") ? "active" : "" %>" href="<%= context %>/about.jsp">About Us</a></li>
  <li><a class="<%= uri.contains("login.jsp") ? "active" : "" %>" href="<%= context %>/login.jsp">Login</a></li>
  <li><a class="<%= uri.contains("shop") ? "active" : "" %>" href="<%= context %>/shop">Shop</a></li>
  <li><a class="<%= uri.contains("checkout.jsp") ? "active" : "" %>" href="<%= context %>/checkout.jsp">Cart</a></li>
</ul>  
            </nav>
        </header>
    </body>
</html>