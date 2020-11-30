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
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel = "stylesheet" type = "text/css" href = "profilePageLayout.css?ver=1.1">
<style>
         hr{
            width:700px;
            margin-right: 100px;
         }
   </style>
</head> 
    
<body>
	<div class="frame" style="width:0px; margin:auto;">
     <iframe src="headerAndNavi.jsp" width="1700px" height="900px" scrolling = "no" frameborder ="0" style="position:relative; left:50%; margin-left:-850px; border-style:none;"></iframe>
  	 <div class = "row" style="position:relative; left:50%; margin-left:-600px;"> 
      <div class = "column middle" style="position:absolute; top:-70px; border:1px solid #D9D9D9; border-radius:7px; background-color:#ffffff; clear:both;">
         <iframe src="profileImgUpload.jsp" width="250px" height="270px" scrolling = "no" frameborder ="0" style="margin-left:30px; margin-top:30px;"></iframe>                        
         <div class = "column updown">
         	<p style="margin-top:50px;">
               <hr>
            <h4><%= session.getAttribute("sessionID") %></h4>
            <h4>email : <%= session_email  %> &nbsp;&nbsp; school : <%=session_school  %></h4>
            <hr>
         </p>
            <iframe src="garden.jsp" width="900px" height="270px" scrolling = "no" frameborder ="0" style="position:relative; margin-left:-160px;"></iframe></li>
         </div>  
         <iframe src="calendar.html" width="840px" height="500px" scrolling = "no" frameborder ="0"></iframe>    
         <iframe src="timetableUpload.jsp" width="340px" height="500px" scrolling = "no" frameborder ="0"></iframe>      
         <iframe src="recentfeed.jsp" width = "1200px" height = "800px" frameborder ="0" scrollbars="0"; style="position:relative; margin-left:30px;" ></iframe>                
   </div>
   <iframe src="footer.jsp" width="1200px" height="200px" scrolling = "no" frameborder="0" style="position:relative; clear:both; bottom:-1700px;"></iframe>
   </div>
   </div>
</body> 
</html>  