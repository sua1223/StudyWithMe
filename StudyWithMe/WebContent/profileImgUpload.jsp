<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%> 
<%@ page import="java.sql.*" %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>

<% 
Connection conn =null;
Statement stmt= null;
ResultSet rs= null;
String session_profileImg = "";
	
try {
  	Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
   	System.err.print("ClassNotFoundException :");
}

try{   		
   	String jdbcurl= "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
   	conn = DriverManager.getConnection(jdbcurl , "root","0814");
   	String query= "select * from user_info where id = '" + session.getAttribute("sessionID") + "';";
   	
   	System.out.println("session ID = " + session.getAttribute("sessionID"));
   	stmt = conn.createStatement();
	rs=stmt.executeQuery(query);

	if(rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
       {
			session_profileImg = rs.getString("profile_url");
		}
		
	} catch(SQLException e) {
		System.out.println("DB 연결 에러");
}
%>

<% 
if( session_profileImg == null)
{%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
	<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
	<title>Insert title here</title> 
	</head> 
		<img src = "images/blank-profile.png" width = "200px" height = "200px" />
		<form method="post" enctype="multipart/form-data" action="profileImg.jsp"> 
			<center>
			<input type="file" name="filename1" size=20><br>
			<input type="submit" value = "프로필등록">
			</center>
		</form> 

	<body> 
	</body> 
	</html>
<%}

else {
	response.sendRedirect("profileImg_db.jsp");
} %>