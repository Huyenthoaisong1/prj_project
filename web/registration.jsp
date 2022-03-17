
<%-- 
    Document   : registration
    Created on : Jan 10, 2020, 2:43:53 PM
    Author     : almam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Account</title>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">

            <div class="regbox box">
                <h1>Register Account</h1>
                <p class="text-registration">${message3}</p>
                <form action="RegisterServlet" method="POST">
   
                  Username: <input type="text" placeholder="Username" name="name" required><br>
                  Password: <input type="password" placeholder="Password" name="password" required><br>
                  
                  Re-Enter Password: <input type="password" placeholder="Repeat Password" name="repassword" required><br>
                    <input type="submit" value="Register"><br>
                    <a href="index">Already have Account?</a><br>
                </form>
            </div>

        </div>

    </body>
</html>
