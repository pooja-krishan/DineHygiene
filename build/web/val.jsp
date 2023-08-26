<%@ page import ="java.sql.*" %>
<%
    try{
        int flag=0;
        String uname = request.getParameter("uname");   
        String pass = request.getParameter("p1");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest?user=root&password=root");
        Statement pst = conn.createStatement();
        String sql = "select uname,pass from user";
        ResultSet rs=pst.executeQuery(sql);
        while(rs.next())
        {
            String dbuname = rs.getString("uname");
            String dbpass = rs.getString("pass");               
        if(dbuname.equals(uname))
        {
            if(dbpass.equals(pass))
            {
                flag=1;
                break;
            }
            else
            {
                out.println("Password is incorrect");
                flag=2;
                break;
            }
        }
        }
        if(flag==0)
        {
            out.println("Username is incorrect");
        }
        else if(flag==1)
        {
           RequestDispatcher rd = request.getRequestDispatcher("userpage.jsp");
           session.setAttribute("user",uname);
           rd.forward(request, response);
        }
    }
   catch(Exception e)
   {    
       out.println(e);   
   }      
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylewrite.css">
    </head>
    <body>
       <a class ="inline-link-1" href="index.html"> Click here to login </a> 
    </body>
</html>