<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.model.CommentDAO" %>
<%@ page import="beans.bean.CommentDTO" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
</head>
<body>
	<%	int value = Integer.parseInt(request.getParameter("value")); 
		int id = Integer.parseInt(request.getParameter("id")); 
		CommentDAO dao=CommentDAO.getInstance();
	    dao.deleteComment(id);
	
	    String url = "comment.jsp?value=" + value;
	    response.sendRedirect(url);
	%>
</body>
</html>