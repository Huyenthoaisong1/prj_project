<%-- 
    Document   : welcome
    Created on : Jan 19, 2020, 10:26:06 PM
    Author     : almam
--%>

<%@page import="model.Account"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Account account = (Account) session.getAttribute("logUser");
    if(account==null){
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        
        <link rel="stylesheet" href="style.css">
        <%ArrayList<Product> prt = (ArrayList<Product>) request.getAttribute("prt");%>
    </head>
    <body>

   <div class="welcome">
       <div class="username">
        <h1> Welcome, <%= account.getUsername() %></h1>
        </div>
        <button><a href="Search">sản phẩm hiện có</a></button>
        <button><a href="LogoutServlet">xuất hóa đơn</a></button>
        <button><a href="Insert">thêm sản phẩm</a></button>
        
        
        </div>

    </body>
</html>
