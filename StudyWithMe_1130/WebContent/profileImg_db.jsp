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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
	<style>
		.filebox label,input{
			margin-top:5px;
 			display: inline-block;
  			padding: .5em .75em;
  			color: #fff;
  			font-size: inherit;
  			line-height: normal;
  			vertical-align: middle;
  			background-color: #7D9CDB;
  			cursor: pointer;
  			border: 1px solid #ffffff;
  			border-radius: .25em;
  			-webkit-transition: background-color 0.2s;
  			transition: background-color 0.2s;
		}

		.filebox label:hover {
 			background-color: #7AB1EC;
		}
		input:hover {
 			background-color: #7AB1EC;
		}

		.filebox label:active {
  			background-color: #4691E0;
		}
		input:active {
  			background-color: #4691E0;
		}

		.filebox input[type="file"] {
  			position: absolute;
  			width: 1px;
  			height: 1px;
 			padding: 0;
  			margin: -1px;
  			overflow: hidden;
  			clip: rect(0, 0, 0, 0);
  			border: 0;
		}
	</style>
</head> 
<body> 
<img style="border-radius:30%;" img src="<%= session_fullpath %>" width = "210px" height = "210px" ></img> 
<form method="post" enctype="multipart/form-data" action="profileImg.jsp"> 
		<div class="filebox">
		<label style="margin-left:15px; " for="exfile">업로드</label>
		<input type="file" id="exfile" name="filename1" size=20>
		<input type="submit" value = "프로필수정">
		</div>
	</form> 
</body> 
</html>