<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%> 
<%@ page import="java.sql.*" %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>

<% 
Connection conn =null;
Statement stmt= null;
ResultSet rs= null;
String session_timetable = "";
	
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
			session_timetable = rs.getString("timetable_url");
		}
		
	} catch(SQLException e) {
		System.out.println("DB 연결 에러");
}
%>

<% 
if( session_timetable == null)
{%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
	<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
	<title>Insert title here</title> 
	<style>
	#container { width : 250px; height : 400px;  border : 1px solid;}
	</style>
	</head> 
		<div id = "container" ></div>
		<form method="post" enctype="multipart/form-data" action="timetableImg.jsp"> 
			<input type="file" name="filename1" size=20> 
			<br>
			<input type="submit" value = "시간표등록"><br><br> 
		</form> 
	<body> 
	</body> 
	</html>
<%}

else {
	response.sendRedirect("timetableImg_db.jsp");
} %>

