<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="beans.model.UserDAO" %>
<%@ page import="beans.bean.UserDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String)session.getAttribute("sessionID");
	UserDAO dao = UserDAO.getInstance();
	UserDTO dto = dao.getData(id);
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
         <iframe src="profileImg.jsp" width="250px" height="270px" scrolling = "no" frameborder ="0" style="margin-left:30px; margin-top:30px;"></iframe>                        
         <div class = "column updown">
         	<p style="margin-top:50px;">
            <hr>
			<h4><%= dto.getId() %><br>email : <%= dto.getE_mail() %> &nbsp;&nbsp; school : <%= dto.getSchool() %></h4>
            <hr>
         </p>
            <iframe src="garden.jsp" width="900px" height="270px" scrolling = "no" frameborder ="0" style="position:relative; margin-left:-160px;"></iframe></li>
         </div>  
         <iframe src="calendar.html" width="840px" height="500px" scrolling = "no" frameborder ="0"></iframe>    
         <iframe src="timetableImg.jsp" width="340px" height="500px" scrolling = "no" frameborder ="0"></iframe>      
         <iframe src="recentfeed.jsp" width = "1200px" height = "800px" frameborder ="0" scrollbars="0"; style="position:relative; margin-left:30px;" ></iframe>                
   </div>
   <iframe src="footer.jsp" width="1200px" height="200px" scrolling = "no" frameborder="0" style="position:relative; clear:both; bottom:-1700px;"></iframe>
   </div>
   </div>
</body> 
</html>  