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
	<link rel = "stylesheet" type = "text/css" href = "profilePageLayout.css">
<title>boardList</title>
</head>
<body>
	<iframe src="headerAndNavi.html" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0"></iframe> 
	<div class="container">
	<div align="right">
	<h1 style="text-align:center">게시판</h1><br><br>
	<form action = "boardList_searched.jsp" method = "post">
		<select class="" name="category" style="width:450px">
            <option value="">검색 카테고리</option>
            <option value="num">번호</option>
            <option value="subject">과목</option>
            <option value="head">말머리</option>
			<option value="title">제목</option>
			<option value="user">작성자</option>
        </select>
		<input type='text' name='word' style="width:100px; letter-spacing: -5px; vertical-align:right">
		<button type='submit'>검색</button>  
	</form>
	<br><br>
	</div>
	<table class="table table-hover">
	   	<thead>
	   	<tr>
	    <th style="width: 5%"> 번호 </th>
        <th style="width: 15%"> 과목 </th>
        <th style="width: 10%"> 말머리 </th>
        <th style="width: 40%"> 제목 </th>
        <th style="width: 20%"> 작성자 </th>
        <th style="width: 10%"> 날짜 </th>
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
			
			String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
				
			conn=DriverManager.getConnection(jdbcurl,"root","0814");
			
			System.out.println("DB 접속 성공");
			
			String query="select * from board where " + request.getParameter("category") + " like '%" + request.getParameter("word") + "%' order by num desc";
            stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
			
			session.setAttribute("boardId","0");
	   	while(rs.next()){
	%>
	   	<tr>
	      <td> <%=rs.getString("num") %> </td>
	      <td> <%=rs.getString("subject") %> </td>
	      <td> <%= rs.getString("head") %></td>
	      <td> <a href = "post_view.jsp?value=<%=rs.getString("num") %>"> <%= rs.getString("title") %> </a></td>
	      <td> <%= rs.getString("user") %> </td>
	      <td> <%= rs.getString("date") %> </td>
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
		<a class="btn btn-default pull-right" href="post_upload.jsp">글쓰기</a>
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
	</div>
</body>
</html>