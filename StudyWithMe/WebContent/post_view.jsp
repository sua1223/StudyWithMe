<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>post2</title>
   <style type="text/css">
       body {
      text-align: center;
        color: #000000;
        width: 1200px;
    }
      div #wapper {
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

      section {
      background-color: #E2EEFE;
      width: 100%;
      height: 700px;
    }
    article {
      border-radius:10px;
      position:relative;
      width: 97%;
      height:80%;
      margin:4px;
      padding:0px 5px 1px;
      background-color: #C2D3EA;
    }
  </style>
</head>
<body>
<%
	Connection conn =null;
	Statement stmt= null;
	ResultSet rs= null;
	
	try{
	String driver="com.mysql.jdbc.Driver";
	Class.forName(driver);
	
	String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		
	conn=DriverManager.getConnection(jdbcurl,"root","0814");
	
	System.out.println("DB 접속 성공");
	
	String query = "select * from board where num = '" + session.getAttribute("boardId"); + "';";

  stmt=conn.createStatement();
	rs=stmt.executeQuery(query);
  rs.next();
%>

<div class="container">
    <div id="wapper">
       <section>
          <b>[<%=rs.getString("head") %>] <%=rs.getString("title") %></b>
          <article><p><%=rs.getString("text") %></p>
             </article>
             <form action="boardList.jsp" method="post">
             <input style="width:70px" type="submit" name="" value="목록">
             <input style="width:70px" type="submit" name="" value="삭제">
          </form><br>
       </section>
    </div>
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