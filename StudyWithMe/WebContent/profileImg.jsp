<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko"> 
<head> 
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 


<%
request.setCharacterEncoding("euc-kr"); 
String realFolder = ""; 
String filename1 = ""; 
int maxSize = 1024*1024*5; 
String encType = "euc-kr"; 
String savefile = "images"; 
ServletContext scontext = getServletContext(); 
realFolder = scontext.getRealPath(savefile); 
 
try{ 
MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
Enumeration<?> files = multi.getFileNames(); 
String file1 = (String)files.nextElement(); 
filename1 = multi.getFilesystemName(file1); 
} catch(Exception e) { 
e.printStackTrace(); 
}

String fullpath = "images//" + filename1;

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
		String query = "update user_info set profile_url = '" + fullpath + "' where id = '" + session.getAttribute("sessionID") + "'";
		
		conn = DriverManager.getConnection(jdbcurl,"root","0814");
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
		
		query = "select * from user_info where id = '" + session.getAttribute("sessionID") + "'";
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