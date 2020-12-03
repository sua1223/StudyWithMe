<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.model.BoardDAO" %>
<%@ page import="beans.bean.BoardDTO" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
</head>
<body>
	<% int value = Integer.parseInt(request.getParameter("value")); %>
    <jsp:useBean id="boardBean" class="beans.bean.BoardDTO" /> 
    <jsp:setProperty name="boardBean" property="num" value="<%=value %>" />
	<%
	    BoardDAO dao=BoardDAO.getInstance();
	    dao.deleteBoard(boardBean);
	
	    response.sendRedirect("boardList.jsp?value=1");
	%>
</body>
</html>