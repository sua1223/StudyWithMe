<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
    
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn =null;
	Statement stmt = null;
	ResultSet rs= null;
   	String session_email = "";
   	String session_school = "";
   	
   	try {
   	Class.forName("com.mysql.jdbc.Driver");
   	} catch (ClassNotFoundException e) {
   		System.err.print("ClassNotFoundException :");
   	}
   	
	try{
	
		String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		String query = "select * from user_info where id = '" + session.getAttribute("sessionID") + "'";
		
		conn = DriverManager.getConnection(jdbcurl,"root","0814");
		stmt = conn.createStatement();
		rs=stmt.executeQuery(query);
		
		if(rs.next())
		{
			session_email = rs.getString("e_mail");
			session_school = rs.getString("school");
		}
	
	} catch(SQLException sqle){
		System.out.println("SQL 실행 에러");
	}
   	stmt.close();
   	conn.close();
 %>
    
<!DOCTYPE html> 
<html> 
<head> 
	<meta charset="UTF-8">
	<link rel = "stylesheet" type = "text/css" href = "profilePageLayout.css">
</head> 
      
<body>
	<div class = "frame">
		<div class = "nav"> 
			 <a href = "#">Home</a> 
			 <a href = "#">About</a> 
			 <a href = "#">Profile</a> 
			 <a href = "logout.jsp"> Logout </a>
		</div> 
	<div class = "header"></div>	
	
	<div class = "row"> 
		<div class = "column side">    
		</div>
		<div class = "column middle">
			<iframe src="profileImgUpload.jsp" width = "250px" height = "270px" scrolling = "no" frameborder ="0"></iframe>            	         
			<div class = "column updown">
				<h2> <%= session.getAttribute("sessionID") %><br>email : <%= session_email  %> &nbsp;&nbsp; school : <%=session_school  %></h2>
				<iframe src="garden.html" width = "950px" height = "270px" scrolling = "no" frameborder ="0"></iframe></li>
			</div>	
			<iframe src="calendar.html" width = "840px" height = "500px" scrolling = "no" frameborder ="0"></iframe>    
			<iframe src="timetableUpload.jsp" width = "340px" height = "500px" scrolling = "no" frameborder ="0"></iframe>      
			<iframe src="recentfeed.jsp" width = "1200px" height = "2000px" scrolling = "yes" frameborder ="0"></iframe>        	     
		</div>
		<div class = "column side">
		</div>
	</div>
	
	<div class = "footer">
		<p class="copyright">&copy;2020 webProject</p>
	</div>
	</div>
</body> 
</html>  