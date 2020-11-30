<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.* " %>
<%
   request.setCharacterEncoding("UTF-8");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="makeFeed.css" />
<title>Insert title here</title>
</head>
<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
		<div id="main">
		<div class="inner" align="center">
		
			   <%
	   	int value=0;
			   
		Connection conn =null;
		Statement stmt= null;
		ResultSet rs= null;
		value=Integer.parseInt(request.getParameter("num"));
		
		try{
			String driver="com.mysql.jdbc.Driver";
			Class.forName(driver);
			
			String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
				
			conn=DriverManager.getConnection(jdbcurl,"root","0814");
			
			System.out.println("DB 접속 성공");
			
			String query="select * from feed where num='"+value+"';";
			stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
			
			rs.next();
			
	  	if( rs.getString("id").equals(session.getAttribute("sessionID"))) { %>
	   	<span class="image main"><img src=" <%= rs.getString("pic") %>	" alt="" /></span>  	
		<h3 align="center"><%=rs.getString("text")%> </h3>
		<b><a href="recentfeed.jsp"  id="feed" class="primary" >MY FEED</a></b> &nbsp;&nbsp;&nbsp;
		<b><a href ="feed_delete.jsp?value=<%= rs.getInt("num") %>" >삭제</a></b>
		<%} else {%>	
		<span class="image main"><img src=" <%= rs.getString("pic") %>	" alt="" /></span>  	
		<h3 align="center"><%=rs.getString("text")%> </h3>
		<b><a href="othersfeed.jsp" id="feed" class="primary" >Others FEED</a></b> &nbsp;&nbsp;&nbsp;
		<% }
	 
		}catch(ClassNotFoundException e){
			System.out.println("JDBC 드라이버 로드 에러");
			e.printStackTrace();
		}catch(SQLException sqle){
			System.out.println("SQL 실행 에러");
		}
	   	stmt.close();
	   	conn.close();
	   %>
	   
	   <script>
/* 		var feedImg = document.createElement("img");
		uploadImg.setAttribute("width", "200px");
		uploadImg.setAttribute("height", "200px"); */
	   </script>
	
						</div>
					</div>

				<!-- Footer -->

			</div>

		<!-- Scripts -->
<!-- 			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> -->

	</body>
</html>