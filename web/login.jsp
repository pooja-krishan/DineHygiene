<%-- 
    Document   : login.jsp
    Created on : 14 Feb, 2020, 9:21:47 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Login</title>
    </head>
    <body>
        <center>
            <fieldset style="width:300px; height:300px;">
                <form name="log" method="post" action="val.jsp">
                    <h2 style="color:#00ffff"> Login </h2>
                    <div class="gap">   </div>
                    <p> <input type="text" id="uname" name="uname" placeholder="Username" style="width:150px;"/> </p>
                    <p> <input type="password" id="p1" name="p1" placeholder="Password" style="width:150px;"/> </p>
                    <p> <button class="modern" style="height:30px;width:150px;border-radius:20px/60px;background-image:linear-gradient(to right, rgba(188,98,223,1), rgba(94,40,253,1));color:white;"> Let me in </button> </p>
                    <p> <a href="index.html"> Not registered? Sign up </a> </p>
                </form>
            </fieldset>
        </center>
    </body>
</html>
