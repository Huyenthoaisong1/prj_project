<%-- 
    Document   : update
    Created on : Feb 11, 2022, 2:51:05 PM
    Author     : SAP-LAP-FPT
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
        <%
              ArrayList<Product> prt = (ArrayList<Product>) request.getAttribute("prt");
            Product p = (Product)request.getAttribute("product");
        %>
    </head>
    <body>
        <form action="Update" method="POST">
            Name:<%=p.getName()%> <input type="hidden" name="name" value="<%=p.getName()%>"/> <br/>
            Price: <input type="text" name="price" value="<%=p.getPrice()%>" /> <br/>
            Type: <input type="text" name="type" value="<%=p.getType()%>" /> <br/>
         
            <input type="submit" value="Save"/>
            
        </form>
           
    </body>
</html>
