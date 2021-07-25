<%@page import="java.sql.*"%>


<%
      
    String id = request.getParameter("id");    
        
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/1lAIHXc8Va","1lAIHXc8Va","TEMA3CTgGO");    

    //con = DriverManager.getConnection("jdbc:mysql://localhost/student_db","root","");
    
    pst = con.prepareStatement("delete from student_db where id = ?");
    //pst = con.prepareStatement("delete from records where id = ?");
     
    pst.setString(1,id);

    pst.executeUpdate();
    
%> 
    
<script>
    alert("record deleted.");
    window.location.href="index.jsp";
</script>




