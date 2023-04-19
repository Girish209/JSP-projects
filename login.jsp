<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
ResultSet rs=null;
Connection con=null;
PreparedStatement ps=null;
String query="select name from userinfo where email=? and password=?";
try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","IamIronman");
ps=con.prepareStatement(query);
ps.setString(1,email);
ps.setString(2,password);
rs=ps.executeQuery();
if(rs.next())
{
    RequestDispatcher rd=request.getRequestDispatcher("Dashboard.jsp");
    rd.forward(request, response);
    String str=rs.getString(1);
}
}catch(Exception e){
out.println(e);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="container">
    <form method="post" action="login.jsp">
        <div class="head">
            <header id="header">Login</header>
        </div>
        <div class="inputbox">
            <input type="email" name="email" required>
            <span>Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
        </div>
        <div class="inputbox">
            <input type="password" name="password" required>
            <span>Password</span>
        </div>
        <div id="row1">
            <a href="#">forgot password?</a>
        </div>
        <div id="row2">
            <input type="submit" name="login">
        </div>
        <div id="row3">
            Don't have account?
            <a href="newereg.html">signup</a>
        </div>
    </form>
</div>

</body>
</html>