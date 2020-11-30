<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
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
        margin-bottom:200px;
    }
    tr, td {
        height:55px;
        border: 1px solid #adadad;
        padding: 0px 7px 0px;
        background-color:#ffffff;
    }
    article {
      font-size: 20px;
      white-space:pre;
      border-radius:7px;
      position:relative;
      width: 97%;
      height:500px;
      margin:8px;
      padding:5px 3px 3px 5px;
      background-color: #ffffff;
      white-space:pre;
    }
    a{
        border: 1px solid #adadad;
        height:32px;
        border-radius:7px;
        padding:0px 2px 0px;
    }
  </style>
</head>
<body>
 
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
<iframe src="headerAndNavi.jsp" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0" style="margin-left:-280px"></iframe>
	<h1 align="center"><b><%=rs.getString("subject") %></b></h1>
	<hr width="1200px" style="border:solid 1px #adadad">
	<table width=1200px height=500px>
	<tr>
		<td><h3><b>[<%=rs.getString("head") %>] <%=rs.getString("title") %></b></h3></td>
	</tr>
	<tr>
		<td>
		<article><%=rs.getString("text") %></article>
        </td>
    </tr>
    <tr>
    	<td align="center">
          <a class="btn btn-default pull-right" href= "boardList.jsp?value=1">목록</a>
        <% if( rs.getString("user").equals(session.getAttribute("sessionID")) )  {%>
       <a class="btn btn-default" href = "post_modify.jsp?value=<%=rs.getString("num") %>">수정</a>
        <a class="btn btn-default" href = "post_delete.jsp?value=<%=rs.getString("num") %>">삭제</a>

        
        <% }
        	System.out.println(session.getAttribute("sessionID") + " " + rs.getString("user"));%>
        
        </td>
    </tr>
</table>
   <iframe src="footer.jsp" width = "1200px" height = "200px" scrolling = "no" frameborder ="0" style="bottom:-30px;"></iframe>
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