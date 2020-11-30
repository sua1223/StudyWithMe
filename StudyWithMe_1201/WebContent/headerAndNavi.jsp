<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
<!DOCTYPE html> 
<html> 
<head> 
   <meta charset="UTF-8">
   <link rel="stylesheet" type="text/css" href = "profilePageLayout.css?ver=1.1">
</head> 
<body>
   <div class = "nav"> 
       <a href="mainPage.jsp" target="_parent">Home</a>
      <a href="about.jsp" target="_parent">About</a>
      <a href="profilePageLayout.jsp" target="_parent">Profile</a>
      <a href="boardList.jsp?value=1" target="_parent">Board</a>
      <ul>
         <li><b>Welcome, <%= session.getAttribute("sessionID") %></b></li>
      </ul>
      <a href="logout.jsp" target="_parent" style="float:right; margin-right:20px;">Sign out</a>
   </div> 
   <div class = "header"></div>
</body> 
</html>  