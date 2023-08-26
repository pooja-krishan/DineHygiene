<%@ page import ="java.sql.*" %>
<%
    try{
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("uname");   
        String pass = request.getParameter("p1");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest?user=root&password=root");
  
        PreparedStatement pst = conn.prepareStatement("insert into user (fname,lname,uname,pass) values (?,?,?,?)");
        pst.setString(1, fname);
        pst.setString(2, lname);
        pst.setString(3, uname);
        pst.setString(4, pass);
        int rs = pst.executeUpdate();     //Returns the number of rows affected by the SQL Statement                   
        if(rs==1)
        {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
   catch(Exception e)
   {    
       out.println("Username already exists");   
   }      
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylewrite.css">
    </head>
    <body>
       <a class ="inline-link-1" href="index.html"> Click here to go back to register </a> 
    </body>
</html>    
