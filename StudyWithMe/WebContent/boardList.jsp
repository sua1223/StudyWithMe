<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>boardList</title>
</head>
<body>
<div class="container">
<div align="right">
<h1 style="text-align:center">웹프로그래밍</h1><br><br>
<input type='text' name='word' style="width:100px; letter-spacing: -5px; vertical-align:right">
<button type='submit'>검색</button>  
<br><br>
</div>
<table class="table table-hover">
   <thead>
   <tr>
      <th> 번호 </th>
      <th> 말머리 </th>
      <th> 제목 </th>
      <th> 작성자 </th>
      <th> 날짜 </th>
   </tr>
   </thead>
   <tbody>
   <%
	Connection conn =null;
	Statement stmt= null;
	ResultSet rs= null;
	
	try{
		String driver="com.mysql.jdbc.Driver";
		Class.forName(driver);
		
		String jdbcurl="jdbc:mysql://localhost:3306/wpsampledb?serverTimezone=UTC";
			
		conn=DriverManager.getConnection(jdbcurl,"root","0814");
		
		System.out.println("DB 접속 성공");
		
		String query="select * from boardlist";
		stmt=conn.createStatement();
		rs=stmt.executeQuery(query);
		
   	while(rs.next()){
   	%>
   	<tr>
      <td> <%=rs.getString("num") %> </td>
      <td> <%= rs.getString("head") %></td>
      <td> <%= rs.getString("title") %></td>
      <td> --- </td>
      <td> --- </td>
   </tr>
   <%
   	}
	}catch(ClassNotFoundException e){
		System.out.println("JDBC 드라이버 로드 에러");
		e.printStackTrace();
	}catch(SQLException sqle){
		System.out.println("SQL 실행 에러");
	}
   	stmt.close();
   	conn.close();
   %>
	</tbody>
</table>
<hr/>
<a class="btn btn-default pull-right">글쓰기</a>
   <div class="text-center">
      <ul class="pagination">
         <li><a href="#">1</a></li>
         <li><a href="#">2</a></li>
         <li><a href="#">3</a></li>
         <li><a href="#">4</a></li>
         <li><a href="#">5</a></li>
      </ul>
   </div>
</div>
</body>
</html>