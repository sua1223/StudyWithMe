<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko"> 
<head> 
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
<% 

System.out.println("DB 접속 성공");


request.setCharacterEncoding("UTF-8"); 
String realFolder = ""; 
String filename1 = ""; 
int maxSize = 1024*1024*5; 
String encType = "UTF-8"; 
String savefile = "images"; 
ServletContext scontext = getServletContext(); 
realFolder = scontext.getRealPath(savefile); 
 

Connection conn =null;
Statement stmt= null;
ResultSet rs= null;



try{ 
MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
Enumeration<?> files = multi.getFileNames(); 
String file1 = (String)files.nextElement(); 
filename1 = multi.getFilesystemName(file1); 

String fullpath = "images//" + filename1;


String driver="com.mysql.jdbc.Driver";
Class.forName(driver);

String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
	
conn=DriverManager.getConnection(jdbcurl,"root","0814");

System.out.println("DB 접속 성공");
/* int i=10; //num을 몰라서 그냥해줌
int num=i; */
String pic = fullpath;
String text = multi.getParameter("message");
System.out.println(multi.getParameter("message"));


String query = "insert into feed (id ,pic, text, upload_date) values ('" + session.getAttribute("sessionID") + "','" + pic + "','" + text + "'," + "NOW() )";

stmt=conn.createStatement();
stmt.executeUpdate(query);

query="select num from feed order by num desc;";
rs=stmt.executeQuery(query);
rs.next();

String redirect_feed="feed_view.jsp?num="+rs.getString("num");
response.sendRedirect(redirect_feed);


} 


catch(Exception e) { 
e.printStackTrace(); 
} 
String fullpath = "images/" + filename1;

stmt.close();
conn.close();
 %> 
</head> 
<body> 

<%-- <img src="<%=fullpath%>" width=200 height=200></img> 
 --%></body> 
</html>

