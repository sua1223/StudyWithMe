<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko"> 
<head> 
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 
<%@ page import="beans.model.UserDAO" %>
<%@ page import="beans.bean.UserDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
	int maxSize = 1024*1024*5; 
	ServletContext scontext = getServletContext(); 
	String realFolder = scontext.getRealPath("images"); 
	String url = "";

	try{ 
		MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, "euc-kr", new DefaultFileRenamePolicy()); 
		Enumeration<?> files = multi.getFileNames(); 
		String file = (String)files.nextElement(); 
		url = "images//" + multi.getFilesystemName(file);
	} catch(Exception e) { 
		e.printStackTrace(); 	
	}
%>
	<jsp:useBean id="userBean" class="beans.bean.UserDTO" />
	<jsp:setProperty name="userBean" property="*" />
<%
	String id = (String)session.getAttribute("sessionID");
	UserDAO dao = UserDAO.getInstance();
	dao.uploadPath(id, url, "timetable_url");

	response.sendRedirect("timetableImg.jsp");	
%>