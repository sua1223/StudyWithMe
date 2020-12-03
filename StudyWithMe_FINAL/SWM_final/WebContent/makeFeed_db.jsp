<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko"> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="beans.model.FeedDAO" %>
<%@ page import="beans.bean.FeedDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>

<%
	int maxSize = 1024*1024*5; 
	ServletContext scontext = getServletContext(); 
	String realFolder = scontext.getRealPath("images"); 
	String url = "";
    String text = "";

	try{ 
	    MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, "UTF-8", new DefaultFileRenamePolicy()); 
        Enumeration<?> files = multi.getFileNames(); 
        String file = (String)files.nextElement(); 
		url = "images//" + multi.getFilesystemName(file);
        text = multi.getParameter("message");

	} catch(Exception e) { 
		e.printStackTrace(); 	
	}

	String id = (String)session.getAttribute("sessionID");
	FeedDAO dao = FeedDAO.getInstance();
	FeedDTO dto = dao.uploadFeed(id, url, text);

	response.sendRedirect("feed_view.jsp?value=" + dto.getNum());
%>
