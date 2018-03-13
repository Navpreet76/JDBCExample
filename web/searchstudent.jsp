<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search Student</h1>
        <%
            try {
                String stuid = request.getParameter("stuid");
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8889/student_records","root","root" );
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from student where id="+stuid);
                if(rs.next())
                {
                    String n = rs.getString("name");
                    String p = rs.getString("phone");
                    out.println("<form action='updatestudent'>");
                    out.println("<br/>id : <input type=text style='background-color:green' "+ "name=id value="+stuid+" readonly>");
                    out.println("<br/>name : <input type=text name=name value="+n+" >");
                    out.println("<br/>phone : <input type=text name=phone value="+p+" >");
                    out.println("<br/><input type=submit value='Update Record'>");
                    out.println("</form");
                    con.close();
                    
                }
            } catch (Exception e) {
                out.println(e.toString());
            }
            
            %>
    </body>
</html>
