<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.BoardDAO" %>
<%@ page import="beans.bean.BoardDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%request.setCharacterEncoding("UTF-8");%>
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
	<div class="container">
	<iframe src="headerAndNavi.jsp" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0" style="margin-left:-280px"></iframe> 
	<div align="right">
	<h1 style="text-align:center"><b>게시판</b></h1>
	<hr width="1130px" style="border:solid 1px #adadad">
	<div align="right">
	<form action = "boardList_searched.jsp" method = "post">
		<select class="" name="category" style="width:200px; height:25px">
            <option value="">검색 카테고리</option>
            <option value="subject">과목</option>
            <option value="head">말머리</option>
			<option value="title">제목</option>
			<option value="user">작성자</option>
        </select>
		<input type='text' name='word' style="width:100px; vertical-align:right">
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
	String category = request.getParameter("category");
	String word = request.getParameter("word");
	int value = Integer.parseInt(request.getParameter("value"));

    BoardDAO dao = BoardDAO.getInstance();
    ArrayList<BoardDTO> list = dao.searchBoardList(category, word);
    
	for(int i = value > 0 ? (value - 1) * 10 + 1 : 1; i <= list.size() && i <= value * 10; i++) {	
		BoardDTO dto = list.get(i - 1);
%>
	   	<tr>
	      <td> <%= i %> </td>
	      <td> <%= dto.getSubject() %> </td>
	      <td> <%= dto.getHead() %></td>
	      <td> <a href = "post_view.jsp?value=<%= dto.getNum() %>"> <%= dto.getTitle() %> </a></td>
	      <td> <%= dto.getUser() %> </td>
	      <td> <%= dto.getDate() %> </td>
	   </tr>
<%
    }
%>
		</tbody>
	</table>
	<hr/>
		<a class="btn btn-default pull-right" href="post_upload.jsp">글쓰기</a>
			<div class="text-center">
			   <ul class="pagination">
			      <li><a href="boardList.jsp?value=<%= value -= 1 %>"> 이전 </a></li>
			      <li><a href="boardList.jsp?value=<%= value += 2 %>"> 다음 </a></li>
			   </ul>
			</div>
		</div>
	</div>
</body>
</html>