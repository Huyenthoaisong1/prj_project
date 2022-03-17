<%-- 
    Document   : cart
    Created on : Feb 25, 2022, 2:59:33 PM
    Author     : SAP-LAP-FPT
--%>

<%@page import="model.OrderDetail"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            Order order = (Order)session.getAttribute("shoppingcart");
        %>
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
         <link href="css/styleforcheckou.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <% if(order !=null){ %>
        <table border="1px">
            <tr>
                <td>Product</td>
                <td>Quantity</td>
                <td>UnitPrice</td>
                <td>Total</td>
            </tr>
            <% for (OrderDetail od : order.getDetails()) {
            %>
            <tr>
                <td><%=od.getProduct().getName()%></td>
                <td><%=od.getQuantity() %></td>
                <td>
                    <%=od.getUnitPrice()%>
                </td>
                <td><%=od.getTotal() %></td>
            </tr>
            <%}%>
            <tr>
                <td colspan="3"></td>
                <td><%=order.getTotal()%></td>
            </tr>
        </table>
        <%}else{%>
        <div class="worddisplay">
        Chưa có sản phẩm nào trong hóa đơn
        </div>
        <%}%>
        <div class="checkout">
          <a href="Search">Thêm sản phẩm vào hóa đơn</a><br>
          <a href="welcome.jsp">Về trang chính</a>
          <a class="checkout1" href="welcome.jsp">thanh toán</a>
        </div>

    </body>

</html>
