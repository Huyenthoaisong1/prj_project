<%-- 
    Document   : insert
    Created on : Feb 9, 2022, 2:58:56 PM
    Author     : dell
--%>

<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">
        <title>JSP Page</title>
        <%
            ArrayList<Product> product = (ArrayList<Product>)request.getAttribute("product");
        %>
    </head>
    <body>
        <form action="Insert" method="POST">
            Name: <input type="text" name="name"/> <br/>
            Price: <input type="text" name="price"/> <br/>
            Type: <input type="text" name="type" /> <br/>
            </select>
            <br/>
            <input type="submit" value="Save"/>
        </form>
    </body>
</html>
