<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.FeedDAO" %>
<%@ page import="beans.bean.FeedDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
   <style type="text/css">
   a{text-decoration:none}
   .feedButton { width:60px; height:30px;}
   .feedButton div.btn_wrap { position:relative; float:right; width:60px; height:30px;  }
   .feedButton div.btn_wrap span { margin-left: 170px; margin-top:-8px;position:absolute; left:100px; top:10px; display:block; width:60px; height:30px; line-height:30px; background:#333; font-size:11px; color:#fff; text-align:center; border:0; border-radius:3px;}
 
  	::-webkit-scrollbar{width: 16px;}
	::-webkit-scrollbar-track {background-color:#ffffff;}
	::-webkit-scrollbar-thumb {background-color:#ffffff;border-radius: 10px;}
	::-webkit-scrollbar-thumb:hover {background: #ffffff;}
	::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
	width:16px;height:16px;background:#ffffff;}
}
</style>
<meta charset="UTF-8">
	<link rel = "stylesheet" type = "text/css" href = "recentfeed.css">

<title>Insert title here</title>
</head>
<body>
<br><br>
      <div class="feedButton">
   		<div class="btn_wrap">
		<div style="width:300px">
   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="5px"><b>My Recent Feed</b></font>
   		 	</div>
      			<span>
         			<a href="makeFeed.jsp" style="color:white">UPLOAD</a>		
				</span>
			</div>
		</div>                     
   <%
		String id = (String)session.getAttribute("sessionID");
		FeedDAO dao = FeedDAO.getInstance();
		ArrayList<FeedDTO> list = dao.showMyFeed(id, true);
	%>
		<div id="wrapper">
			<div id="main">
				<div class="inner">
					<section class = "tiles">
               
	        <% 
		   	for(int i = 1; i <= list.size() ; i++) {
				   FeedDTO dto = list.get(i-1);
		   	%>
							<article class="style<%= i %>">
								<span class="image">
									<img src= "<%= dto.getPic() %>"/>
								</span>
								<a href="feed_view.jsp?value=<%= dto.getNum() %>"></a>
            				</article> 
			<% } %>
               		</section>
            	</div>
        	 </div>
    	</div>
  	</body>
</html>