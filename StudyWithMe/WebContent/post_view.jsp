<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>post2</title>
   <style type="text/css">
    *{
     	font-family:sans-serif;
    }
    table{
        padding: 10px 0px 30px;
    }
    tr, td {
        height:45px;
        border: 1px solid #adadad;
        padding: 0px 7px 0px;
        background-color:#ffffff;
    }
    article {
      white-space:pre;
      border-radius:7px;
      position:relative;
      width: 97%;
      height:1200px;
      margin:8px;
      padding:0px 5px 1px;
      background-color: #ffffff;
    }
    input{
        border: 1px solid #adadad;
        height:32px;
        border-radius:7px;
        padding:0px 2px 0px;
    }
  </style>
</head>
<body>
<iframe src="headerAndNavi.html" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0"></iframe> 
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