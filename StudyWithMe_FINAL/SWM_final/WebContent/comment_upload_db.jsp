<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.CommentDAO" %>
<%@ page import="beans.bean.CommentDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% String userID = (String)session.getAttribute("sessionID");
int value = Integer.parseInt(request.getParameter("value"));
%>
<jsp:useBean id="commentBean" class="beans.bean.CommentDTO" /> 
<jsp:setProperty name="commentBean" property="*" />
<jsp:setProperty name="commentBean" property="user" value="<%= userID %>" />
<jsp:setProperty name="commentBean" property="post_num" value="<%= value %>" />

<%
	CommentDAO dao = CommentDAO.getInstance();
	dao.uploadComment(commentBean);
	System.out.println("123123");
	
	String url = "comment.jsp?value=" + value;
    response.sendRedirect(url);
%>