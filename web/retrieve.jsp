<%@ page import ="java.sql.*" %>
<%
    try{
        float sum=0;
        int count=0;
        float avg=0;
        float food=0;
        float water=0;
        float san=0;
        float personalh=0;
        float insect=0;
        float openk=0;
        String district = request.getParameter("district");
        String area = request.getParameter("area");
        String restaurant = request.getParameter("restaurant");   
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest?user=root&password=root");
        String concat = restaurant + " " + area + " " + district;
        //out.println(concat);
        PreparedStatement pst = conn.prepareStatement("select uname,food,water,sanitation,personalh,rodents,openkitchen,miscellaneous from hygiene where restaurant=?");
        pst.setString(1,concat);
        ResultSet rs = pst.executeQuery(); 
        if(rs.next())
        {
            out.println("<h4 align='center'> User Reviews:</h4>\n");
            do
            {
                int f = Integer.parseInt(rs.getString("food"));
                int w = Integer.parseInt(rs.getString("water"));
                int s = Integer.parseInt(rs.getString("sanitation"));
                int ph = Integer.parseInt(rs.getString("personalh"));
                int ir = Integer.parseInt(rs.getString("rodents"));
                int ok = Integer.parseInt(rs.getString("openkitchen"));
                String miscellaneous = rs.getString("miscellaneous");
                String uname = rs.getString("uname");
                sum = f+w+s+ph+ir+ok;
                food=food+f;
                water=water+w;
                san=san+s;
                personalh=personalh+ph;
                insect=insect+ir;
                openk=openk+ok;
                count=count+1;
                avg=avg+(sum/6);
                sum=0;
                if(!miscellaneous.equals(""))
                {
                    out.println("<h4 align='center'>"+uname+" says "+miscellaneous+"</h4>\n");
                }
            }while(rs.next());
            avg=avg/count;
            food=food/count;
            water=water/count;
            san=san/count;
            personalh=personalh/count;
            insect=insect/count;
            openk=openk/count;
            out.println("<table align='center' cellpadding='0' cellspacing='0' border='0'>"+"\n"
      +"<thead>"+"\n"
        +"<tr>"+"\n"
          +"<th>Parameters</th>"+"\n"
          +"<th>Rating</th>"+"\n"
        +"</tr>"
      +"</thead>"
      +"<tbody align='center'>"+"\n"
        +"<tr>"+"\n"
          +"<td>Food Quality</td>"+"\n"
          +"<td>"+food+"</td>"+"\n"
        +"</tr>"
        +"<tr>"+"\n"
          +"<td>Potable Water</td>"+"\n"
          +"<td>"+water+"</td>"+"\n"
        +"</tr>" 
        +"<tr>"+"\n"
          +"<td>Sanitation</td>"+"\n"
          +"<td>"+san+"</td>"+"\n"
        +"</tr>"
        +"<tr>"+"\n"
          +"<td>Personal Hygiene</td>"+"\n"
          +"<td>"+personalh+"</td>"+"\n"
        +"</tr>"
        +"<tr>"+"\n"
          +"<td>Pest Encounter</td>"+"\n"
          +"<td>"+insect+"</td>"+"\n"
        +"</tr>"
        +"<tr>"+"\n"
          +"<td>Open Kitchen</td>"+"\n"
          +"<td>"+openk+"</td>"+"\n"
        +"</tr>"          
      +"</tbody>"             
    +"</table>");
        avg = Math.round(avg);
        out.println("Hygiene Rating for "+concat+" is "+" "+avg);    
        }
        else
        {
            out.println("<h2> Sorry! No ratings has been recorded yet! </h2>");
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
    <body align='center'>
        <br>
        <a class ="inline-link-1" href="map.html">Click to view in maps</a>
    </body>
</html>