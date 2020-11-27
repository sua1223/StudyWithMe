<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
	<meta charset="utf-8">
  <title>post2</title>
	<style type="text/css">
		body {
      text-align: center;
		  color: #000000;
		  width: 1200px;
    }
		div#wapper {
      width: 100%;
			min-height: 300px;
			text-align: left;
			margin: 0 auto;
    }
		header, footer, nav, section {
      border-radius:10px;
      border: 1px solid #000000;
			margin: 5px;
			padding: 10px;
    }
		header {
      height: 50px;
      background-color: #85ACD8;
    }
		nav, section {
      float: left;
      height: 500px;
    }
		nav {
      background-color: #85ACD8;
      width: 150px;
    }
		section {
      background-color: #E2EEFE;
      width: 1010px;
    }
    footer {
      height: 50px;
    	background-color: #85ACD8;
    	position: relative;
    	clear: both;
    }
    article {
      border-radius:10px;
      position:relative;
      width: 97%;
      height:90%;
    	margin:4px;
      padding:0px 5px 1px;
    	background-color: #C2D3EA;
    }
    form{
      position:absolute;
      bottom:10px;
    }
  </style>
</head>
<body>
    <div id="wapper">
    		<header><p>header</p></header>
    		<nav>
    			<b>자주가는 게시판</b>
          <hr style="border:solid 1px #000000">
    			<ul>
    				<li><a href="">시스템소프트웨어</a></li>
    				<li><a href="">웹 프로그래밍</a></li>
    				<li><a href="">심화 프로그래밍</a></li>
    			</ul>
    		</nav>
<%
	Connection conn =null;
	Statement stmt= null;
	ResultSet rs= null;
	int value = Integer.parseInt(request.getParameter("value"));
    
	try{
	String driver="com.mysql.jdbc.Driver";
	Class.forName(driver);
	
	String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		
	conn=DriverManager.getConnection(jdbcurl,"root","0814");
	
	System.out.println("DB 접속 성공");
	
	String query = "select * from board where num = '" + value + "';";

	stmt=conn.createStatement();
	rs=stmt.executeQuery(query);
	rs.next();
%>

<div class="container">
<table width=100% height="90%">
	<tr>
		<td><h2 align="center"><%=rs.getString("subject") %></h2></td>
	</tr>
	<tr>
		<td><h4>[<%=rs.getString("head") %>] <%=rs.getString("title") %></h4></td>
	</tr>
	<tr>
		<td>
		<article style="white-space:pre;"><%=rs.getString("text") %></article>
		
        </td>
    </tr>
    <tr>
    	<td>
        <a class="btn btn-default pull-left" href= "boardList.jsp?value=1">목록</a>
        <a class="btn btn-default pull-left" href = "post_delete.jsp?value=<%=rs.getString("num") %>">삭제</a>
        </td>
    </tr>
</table>
   </div>
   <%
	   	
		}catch(ClassNotFoundException e){
			System.out.println("JDBC 드라이버 로드 에러");
			e.printStackTrace();
		}catch(SQLException sqle){
			System.out.println("SQL 실행 에러");
		}
	   	stmt.close();
	   	conn.close();
	 %>
</body>
</html>