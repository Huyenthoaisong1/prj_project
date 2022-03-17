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
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="box">
                <h1>Login Account</h1>
                <a href="insert.jsp"></a>
                <form action="index" method="POST">
                    <p class="text-danger">${message}</p>
                    <p class="text-registration">${message2}</p>
                    
                    <div class="text">
                        Username: <input type="text" name="username" /> <br/>
                        Password: <input type="password" name="password"/> <br/>
                    </div>
                    <input type="submit" value="Login" /><br>
                    <a href="registration">Create New Account</a><br>
                </form>
            </div>
        </div>

    </body>
</html>
