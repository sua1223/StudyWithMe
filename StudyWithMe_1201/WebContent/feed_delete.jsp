<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.FeedDAO" %>
<%@ page import="beans.bean.FeedDTO" %>
<%@ page import="java.sql.*" %>
<%
    int value = Integer.parseInt(request.getParameter("value"));
    FeedDAO dao = FeedDAO.getInstance();
    dao.deleteFeed(value);

    response.sendRedirect("recentfeed.jsp");
%>
