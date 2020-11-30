<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.FeedDAO" %>
<%@ page import="beans.bean.FeedDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" /><link rel="stylesheet" href="makeFeed.css" />
<style>
     ::-webkit-scrollbar{width: 16px;}
   ::-webkit-scrollbar-track {background-color:#ffffff;}
   ::-webkit-scrollbar-thumb {background-color:#ffffff;border-radius: 10px;}
   ::-webkit-scrollbar-thumb:hover {background: #ffffff;}
   ::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
   width:16px;height:16px;background:#ffffff;}
</style>
<title>Insert title here</title>
</head>
<body class="is-preload">
	<div id="wrapper">
		<div id="main">
			<div class="inner" align="center">
		
		<%
		int value = Integer.parseInt(request.getParameter("value"));
		FeedDAO dao = FeedDAO.getInstance();
		FeedDTO dto = dao.viewFeed(value);

	  	if( dto.getId().equals((String)session.getAttribute("sessionID"))) { %>
				<span class="image main"><img src=" <%= dto.getPic() %>" alt="" /></span>  	
				<br><h3 align="center"><%= dto.getText()%> </h3>
				<hr width = "500px" style = "margin-top : -20px;" >
				<b><a href="profilePageLayout.jsp" target="_parent" id="feed" class="primary" >MY FEED</a></b> &nbsp;&nbsp;&nbsp;
				<b><a href ="feed_delete.jsp?value=<%= dto.getNum() %>" >삭제</a></b>
		<%} else {%>	
				<span class="image main"><img src=" <%= dto.getPic() %>	" alt="" /></span> 
				<h2 style = "margin-left:-420px;">[<%= dto.getId() %>] </h2>   
       			<hr width = "500px" style = "margin-top : -30px;" > 	
				<h3 align="center"><%= dto.getText() %> </h3>
				<hr width = "500px" >
				<p style = "margin-top : -20px;"><b><a href="othersfeed.jsp" id="feed" class="primary"  >Others FEED</a></b></p> &nbsp;&nbsp;&nbsp;
		<% }
		%>
				</div>
			</div>
		</div>
	</body>
</html>