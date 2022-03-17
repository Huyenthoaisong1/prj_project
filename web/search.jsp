<%-- 
    Document   : welcome
    Created on : Jan 19, 2020, 10:26:06 PM
    Author     : almam
--%>

<%@page import="model.Order"%>
<%@page import="model.Account"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="css/style.css" rel="stylesheet" type="text/css"/>
<link href="css/styleforsearch.css" rel="stylesheet" type="text/css"/>

        <%

            ArrayList<Product> prt = (ArrayList<Product>) request.getAttribute("prt");
Order order = (Order)session.getAttribute("shoppingcart");
            if(order==null)
                order = new Order();
        %>

        <script>

            function deleteProduct(lnk)
            {
                var result = confirm("Are you sure?");
                var name = lnk.getAttribute('value');
                if (result)
                {
                    var string = 'Delete?name=' + name;

                    window.location.href = string;
                }
            }

            $('#bcd a').each(function () {
                var text = $(this).text();
                alert(text + ': ' + link);
            });

        </script>
    </head>
    <body>
        <div class="size">
  <%=order.getSize()+" "%> items in the shopping cart.
        <%if (prt.size() > 0) {%>
        </div>
        <table border="1px">
            <tr>
                <td>Tên</td>
                <td>Giá</td>
                <td>Thể Loại</td>
                <td>chỉnh sửa sản phẩm</td>
                <td>xóa sản phẩm</td>
              
            </tr>
            <%for (Product P : prt) {
            %>
            <tr>
                <td><%=P.getName()%></td>
                <td><%=P.getPrice()%></td>
                <td><%=P.getType()%></td>
                <td>  <a href="Update?name=<%=P.getName()%>">chỉnh sửa sản phẩm</a>


                <td> <a href="#" onclick="deleteProduct(this)" value="<%=P.getName()%>">xóa sản phẩm so</a></td>
                <td>     <form action="addcart" method="POST"> 
                        <input type="hidden" value="<%=P.getName()%>" name="name"/>
                        <input type="submit" value="Thêm vào hóa đơn"/>
                    </form></td>

            </tr>
            <%}%>
        </table> 
        <%} else {%>
        No record to display.
        <%}%>
        <div class="buttonlayout">
              <button><a href="checkout">Xuất hóa đơn</a></button>
        <button><a href="welcome.jsp">Về trang chính</a></button>
        <button><a href="insert.jsp">Thêm sản phẩm</a></button>
         </div>
    </body>
</html>
