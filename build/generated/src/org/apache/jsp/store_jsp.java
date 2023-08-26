package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class store_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

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
        if(!rs.next())
        {
            out.println("1");
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
            { 
      out.write("\n");
      out.write("                <h3>Successfully recorded review</h3>\n");
      out.write("         ");
 }
        }
        else
        {
            out.println("2");
            do
            {
                out.println("7");
                String dbuname = rs.getString("uname");
                String dbrest = rs.getString("restaurant");
                if(dbuname.equals(uname) && dbrest.equals(restname))
                {
                    out.println("3");
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
                    out.println("4");
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
                out.println("5");
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
                { out.println("6"); 
      out.write("\n");
      out.write("                    <h3>Successfully recorded review</h3>\n");
      out.write("             ");
 }
            }
else if (flag==1)
{ 
      out.write("\n");
      out.write("    <h3>Successfully updated your previous review</h3>\n");
 }
        }
    }
   catch(NullPointerException e)
   {   
      out.write(" \n");
      out.write("       <h3>Successfully recorded review</h3>   \n");
      out.write("   ");
 }  
   catch(Exception e)
   {    
       out.println(e);   
   }      

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
