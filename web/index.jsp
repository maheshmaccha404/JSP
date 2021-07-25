<%-- 
    Document   : index
    Created on : Jul 25, 2021, 3:08:39 PM
    Author     : mahesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

  if(request.getParameter("submit")!= null){
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

    //pst = con.prepareStatement("insert into records(s_no,s_name,s_dob,s_doj)values(?,?,?,?)");
    pst = con.prepareStatement("insert into student_db(s_no,s_name,s_dob,s_doj)values(?,?,?,?)");
    pst.setString(1,no);
    pst.setString(2,name);    
    pst.setString(3,dob);
    pst.setString(4,doj);
    pst.executeUpdate();
    
    %>
    
    <script>
        alert("record added.");
    </script>
<%
  }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Data</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <h1>Student Registration system CRUD using JSP</h1>
        </br>
        <div class="row">
            <%--form creation--%>
            <div class="col-sm-4">
                <form method="POST" action="#">
                    <div align="left">
                        <label class="form-label">Student No:</label>
                        <input type="text" class ="form-control" placeholder="Student no" name="sno" id="sno" required>
                    </div>
                    <div align="left">
                        <label class="form-label">Student Name:</label>
                        <input type="text" class ="form-control" placeholder="Student name" name="sname" id="sname" required>
                    </div>
                    <div align="left">
                        <label class="form-label">Student Date Of Birth:</label>
                        <input type="date" class ="form-control" name="sdob" id="sdob" required>
                    </div>
                    <div align="left">
                        <label class="form-label">Student Date Of Join:</label>
                        <input type="date" class ="form-control" name="sdoj" id="sdoj" required>
                    </div>
                    </br>
                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info" >
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>
                </form>
            </div>
            
            <%--table creation--%>
            <div class="col-sm-8">
                <div class="panel-body">
                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                        <thead>
                            <tr>
                                <th>Student no</th>
                                <th>Student name</th>
                                <th>Student DOB</th>
                                <th>Student DOJ</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                            
                            <%
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                            
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/1lAIHXc8Va","1lAIHXc8Va","TEMA3CTgGO");    

                                //con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
                                
                                String query= "select * from student_db";
                                //String query= "select * from records";
                                Statement st = con.createStatement();
                                
                                rs = st.executeQuery(query);
                                while(rs.next()){
                                    String id =rs.getString("id");
                                   
                            %>
                                    <tr>
                                        <td><%=rs.getString("s_no")%></td>                                
                                        <td><%=rs.getString("s_name")%></td>
                                        <td><%=rs.getString("s_dob")%></td>
                                        <td><%=rs.getString("s_doj")%></td>
                                        <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                                        <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>

                                    </tr>   
                            <%
                                }
                            %>
                            
                        </thead>
                    </table>
                </div>
            </div>
        </div>
             
    </body>
</html>
