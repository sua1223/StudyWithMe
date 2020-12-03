<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.BoardDAO" %>
<%@ page import="beans.bean.BoardDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<% String userID = (String)session.getAttribute("sessionID"); %>
<jsp:useBean id="boardBean" class="beans.bean.BoardDTO" /> 
<jsp:setProperty name="boardBean" property="*" />
<jsp:setProperty name="boardBean" property="user" value="<%= userID %>" />
<%
    BoardDAO dao = BoardDAO.getInstance();
    BoardDTO dto = dao.uploadBoard(boardBean);

    response.sendRedirect("post_view.jsp?value=" + dto.getNum());
%>
