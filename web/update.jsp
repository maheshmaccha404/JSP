<%-- 
    Document   : update
    Created on : Jul 25, 2021, 7:37:04 PM
    Author     : mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

  if(request.getParameter("submit")!= null){   
      
    String id = request.getParameter("id");    
    String no = request.getParameter("sno");    
    String name = request.getParameter("sname");
    String dob = request.getParameter("sdob");   
    String doj = request.getParameter("sdoj");
    
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/1lAIHXc8Va","1lAIHXc8Va","TEMA3CTgGO");  

    //con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
    
    //pst = con.prepareStatement("update records set s_no = ?, s_name = ?,s_dob = ?, s_doj = ? where id = ?");
    pst = con.prepareStatement("update student_db set s_no = ?, s_name = ?,s_dob = ?, s_doj = ? where id = ?");
    pst.setString(1,no);
    pst.setString(2,name);    
    pst.setString(3,dob);
    pst.setString(4,doj);  
    pst.setString(5,id);

    pst.executeUpdate();
    
%> 
    
<script>
    alert("record updated.");
</script>
    
<%
   }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>student update</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>student update</h1>
        <div class="row">
            <div class="col-sm-4">
                <form method="POST" action="#">
                    
                    <%
                        
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        
                        con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/1lAIHXc8Va","1lAIHXc8Va","TEMA3CTgGO");    

                        //con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");

                        String id = request.getParameter("id");
                        pst = con.prepareStatement("Select * from student_db where id = ?");
                        //pst = con.prepareStatement("Select * from records where id = ?");
                        pst.setString(1,id);
                        rs = pst.executeQuery();
                        
                        while(rs.next()){

                    %>

                            <div align="left">
                                <label class="form-label">Student No:</label>
                                <input type="text" class ="form-control" placeholder="Student no" value="<%= rs.getString("s_no")%>" name="sno" id="sno" required>
                            </div>
                            <div align="left">
                                <label class="form-label">Student Name:</label>
                                <input type="text" class ="form-control" placeholder="Student name" value="<%= rs.getString("s_name")%>" name="sname" id="sname" required>
                            </div>
                            <div align ="left">
                                <label class="form-label">Student Date Of Birth:</label>
                                <input type="date" class ="form-control" value="<%= rs.getString("s_dob")%>" name="sdob" id="sdob" required>
                            </div>
                            <div align="left">
                                <label class="form-label">Student Date Of Join:</label>
                                <input type="date" class ="form-control" value="<%= rs.getString("s_doj")%>"name="sdoj" id="sdoj" required>
                            </div>

                    <%
                        }
                    %>
                    
                    </br>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info" >
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                        <a href="index.jsp">Go Back</a>
                    </div>
                    
                    <div align="right">
                    </div>
                    
                </form>
            </div>
        </div>
    </body>
</html>
