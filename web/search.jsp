<%-- 
    Document   : welcome
    Created on : Jan 19, 2020, 10:26:06 PM
    Author     : almam
--%>

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
        <link rel="stylesheet" href="style.css">
        <%

            ArrayList<Product> prt = (ArrayList<Product>) request.getAttribute("prt");

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

        <%if (prt.size() > 0) {%>
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
                <td> <a href="#" onclick='deleteProduct("+<%=P.getName()%>+")'>xóa sản phẩm blank</a></td>

            </tr>
            <%}%>
        </table> 
        <%} else {%>
        No record to display.
        <%}%>
        <button><a href="welcome.jsp">về trang chính</a></button>
        <button><a href="insert.jsp">thêm sản phẩm</a></button>

    </body>
</html>
