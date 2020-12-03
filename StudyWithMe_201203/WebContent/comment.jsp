<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.CommentDAO" %>
<%@ page import="beans.bean.CommentDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<style>
textarea{ 
	width:1000px; 
	height:100px; 
	resize:none;
	border:solid 1px #adadad;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<hr width="1110px" style="border:solid 1px #adadad">
	<table  style="width:1100px">
	   	<thead>
	   	<tr>
		    <th style="width: 15%"> </th>
	        <th style="width: 60%"> </th>
	        <th style="width: 20%"> </th>
	        <th style="width: 10%"> </th>
	   	</tr>
	   	</thead>
	   	<tbody>
<%
	int value = Integer.parseInt(request.getParameter("value"));
	CommentDAO dao = CommentDAO.getInstance();
	System.out.println("dfdfd");
    ArrayList<CommentDTO> list = dao.showComment(value);
	
	for(int i = 1; i <= list.size(); i++) {	
		CommentDTO dto = list.get(i - 1);
 	%>
	   		<tr>
		      <td align=center> <%= dto.getUser() %> </td>
		      <td > <%= dto.getText() %> </td>
		      <td align=center> <%= dto.getDate() %> </td>
		      <%if(dto.getUser().equals(session.getAttribute("sessionID"))) {%>
		      <td> <a class="btn btn-default" href = "comment_delete_db.jsp?id=<%=dto.getId()%>&value=<%=value%>">X</a> </td>
	   		<%} %>
	   		</tr>	
	   		<tr><td>&nbsp;</td></tr>
	 
	  <%
    }
	%>
	 </tbody>
	  </table>
	  <br><br><br> <hr width="1110px" style="border:solid 1px #adadad">
	 <div align="right" style="margin-right:50px">
	 <form action="comment_upload_db.jsp?value=<%=value %>" method="post">
		<textarea style="align:center" name="text" placeholder="댓글을 입력하세요."></textarea><br>
		<input type="submit" style="width:80px; height:35px;" value="등록">
	</form>
	</div>
	</div>
	
	

</body>
</html>