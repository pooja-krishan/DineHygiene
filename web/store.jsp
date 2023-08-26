<%@ page import ="java.sql.*" %>
<%
    try{
        int flag=0;
        String uname = (String)session.getAttribute("user");
        String restname = request.getParameter("restname");
        String food = request.getParameter("food");   
        String water = request.getParameter("water");
        String sanitation = request.getParameter("sanitation");
        String phygiene = request.getParameter("phygiene");
        String insect = request.getParameter("insect");   
        String kitchen = request.getParameter("kitchen");
        String miscellaneous = request.getParameter("miscellaneous");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest?user=root&password=root");
        Statement st = conn.createStatement();
        String sql = "select * from hygiene";
        ResultSet rs=st.executeQuery(sql);
        if(restname == null || restname.isEmpty())
        { %>
            <head>
                <link rel="stylesheet" type="text/css" href="stylewrite.css">
            </head>
            <body>
                <h2>Please scan the QR Code to record your review</h2>
                <a class="inline-link-1" href="feedback.jsp"> Click to give review </a>
            </body>  
        <% }
        else if(!rs.next())
        {
            PreparedStatement pst = conn.prepareStatement("insert into hygiene (uname,restaurant,food,water,sanitation,personalh,rodents,openkitchen,miscellaneous) values (?,?,?,?,?,?,?,?,?)");
            pst.setString(1, uname);
            pst.setString(2, restname);
            pst.setString(3, food);
            pst.setString(4, water);
            pst.setString(5,sanitation);
            pst.setString(6,phygiene);
            pst.setString(7,insect);
            pst.setString(8,kitchen);
            pst.setString(9, miscellaneous);
            int check = pst.executeUpdate();     //Returns the number of rows affected by the SQL Statement                   
            if(check==1)
            { %>
                <head>
                    <link rel="stylesheet" type="text/css" href="stylewrite.css">
                </head>
                <body>
                    <h2>Successfully recorded review</h2>
                    <a class="inline-link-1" href="view.jsp"> Click to view reviews </a>
                </body>
         <% }
        }
        else
        {
            do
            {
                String dbuname = rs.getString("uname");
                String dbrest = rs.getString("restaurant");
                if(dbuname.equals(uname) && dbrest.equals(restname))
                {
                    PreparedStatement ps = conn.prepareStatement("update hygiene set food=?,water=?,sanitation=?,personalh=?,rodents=?,openkitchen=?,miscellaneous=? where uname=? and restaurant=?");
                    ps.setString(1,food);
                    ps.setString(2,water);
                    ps.setString(3,sanitation);
                    ps.setString(4,phygiene);
                    ps.setString(5,insect);
                    ps.setString(6,kitchen);
                    ps.setString(7, miscellaneous);
                    ps.setString(8, uname);
                    ps.setString(9, restname);
                    int r = ps.executeUpdate(); 
                    if(r==1)
                    { 
                    flag=1;
                    break; }
                }
                else
                {
                    flag=0;
                }
            }while(rs.next());
            if(flag==0)
            {   
                PreparedStatement pst = conn.prepareStatement("insert into hygiene (uname,restaurant,food,water,sanitation,personalh,rodents,openkitchen,miscellaneous) values (?,?,?,?,?,?,?,?,?)");
                pst.setString(1, uname);
                pst.setString(2, restname);
                pst.setString(3, food);
                pst.setString(4, water);
                pst.setString(5,sanitation);
                pst.setString(6,phygiene);
                pst.setString(7,insect);
                pst.setString(8,kitchen);
                pst.setString(9, miscellaneous);
                int check = pst.executeUpdate();     //Returns the number of rows affected by the SQL Statement                   
                if(check==1)
                {  %>
                <head>
                    <link rel="stylesheet" type="text/css" href="stylewrite.css">
                </head>
                <body>
                    <h2>Successfully recorded review</h2>
                    <a class="inline-link-1" href="view.jsp"> Click to view reviews </a>
                </body>
                    
             <% }
            }
            else if (flag==1)
            { %>
                <head>
                    <link rel="stylesheet" type="text/css" href="stylewrite.css">
                </head>
                <body>
                    <h2>Successfully updated your previous review</h2>
                    <a class="inline-link-1" href="view.jsp"> Click to view reviews </a>
                </body>
<% }
        }
    }
   catch(Exception e)
   {    
       out.println(e);       
   }     
%>