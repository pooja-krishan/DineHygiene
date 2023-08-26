<%-- 
    Document   : userpage
    Created on : 15 Feb, 2020, 6:52:10 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Page</title>
    </head>
    <body style="background-image: linear-gradient(to right, rgba(62,209,231,1), rgba(169,143,245,1));">
        <% 
        String name = request.getParameter("uname");
        session.setAttribute("user",name);
        %>
        <center>
            <h1 color: white>WELCOME!</h1>
            <p> <a href="feedback.jsp"> <button class="modern" style="height:30px;width:150px;border-radius:20px/60px;background-image:linear-gradient(to right, rgba(188,98,223,1), rgba(94,40,253,1));color:white;"> GIVE FEEDBACK </button> </a> </p>
            <p> <a href="view.jsp"> <button class="modern" style="height:30px;width:150px;border-radius:20px/60px;background-image:linear-gradient(to right, rgba(188,98,223,1), rgba(94,40,253,1));color:white;"> VIEW REVIEW </button> </a> </p>
        </center>
    </body>
</html>
