<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%
String session_fullpath = "";
request.setCharacterEncoding("utf-8");

Connection conn =null;
Statement stmt = null;
ResultSet rs = null;

try {
   	Class.forName("com.mysql.jdbc.Driver");
   	} catch (ClassNotFoundException e) {
   		System.err.print("ClassNotFoundException :");
   	}
   	
	try{
	
		String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";		
		conn = DriverManager.getConnection(jdbcurl,"root","0814");
		stmt = conn.createStatement();
		
		String query = "select * from user_info where id = '" + session.getAttribute("sessionID") + "'";
		rs=stmt.executeQuery(query);

		if(rs.next())
		{
			session_fullpath = rs.getString("profile_url");
		}
		
	} finally
	{
		if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
		if (conn != null) try { conn.close();} catch(SQLException ex) {}
	}
%> 
<head>
</head> 
<body> 
<img src="<%= session_fullpath %>" width=200 height=200></img> 
<form method="post" enctype="multipart/form-data" action="profileImg.jsp"> 
	<center>
	<input type="file" name="filename1" size=20><br>
	<input type="submit" value = "프로필수정">
	</center>
</form> 
</body> 
</html>