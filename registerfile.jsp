<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="register.css">
</head>
<body>
<div class="container2">
        <form method="post" action="register.jsp">
            <div class="head1">
                <header id="header">Add Member</header>
            </div>
            <div class="inputbox">
                <input type="text" id="name" name="Username" required>
                <span>Name&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
            </div>
            <div class="inputbox">
                <input type="email" id="email" name="email" required>
                <span>Email&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
            </div>
            <div class="inputbox">
                <input type="text" id="pass" name="id" required>
                <span>ID/Regd No.</span>
            </div>
            <div class="inputbox">
                <input type="password" name="password1" required>
                <span>Confirm password</span>
            </div>
            <div id="row4">
                <button type="submit">Sign up</button>
            </div>
        </form>
        <%
    String id=request.getParameter("id");
	String name=request.getParameter("Username");
	String email=request.getParameter("email");
	String password=request.getParameter("password1");
	ResultSet rs=null;
	Connection con=null;
	PreparedStatement ps=null;
	RequestDispatcher rd=null;
	String query="insert into userinfo values(?,?,?,?)";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","IamIronman");
		ps=con.prepareStatement(query);
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,email);
		ps.setString(4,password);
		ps.executeUpdate();
		response.sendRedirect("Dashboard.jsp");
		
		
	}catch(Exception e){
		
	}
%>
    </div>
</body>
</html>