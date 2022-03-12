<%-- 
    Document   : login
    Created on : Jan 19, 2022, 3:20:39 PM
    Author     : Sap-lap
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <div class="container">
            <div class="box">
                <h1>Login Account</h1>
                <form action="login" method="POST">
                    <p class="text-danger">${message}</p>
                    <p class="text-registration">${message2}</p>
                    
                    <div class="text">
                        Username: <input type="text" name="username" /> <br/>
                        Password: <input type="password" name="password"/> <br/>
                    </div>
                    <input type="submit" value="Login" /><br>
                    <a href="registration.jsp">Create New Account</a><br>
                </form>
            </div>
        </div>

    </body>
</html>
