<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko"> 
<head> 
<style>
	img{ float: left;
        clear: both;
	}
</style>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%> 
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %> 
<%@ page import="java.sql.*" %> 
<% 
request.setCharacterEncoding("euc-kr"); 
String realFolder = ""; 
String filename1 = ""; 
int maxSize = 1024*1024*5; 
String encType = "euc-kr"; 
String savefile = "images"; 
ServletContext scontext = getServletContext(); 
realFolder = scontext.getRealPath(savefile); 
 
try{ 
MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
Enumeration<?> files = multi.getFileNames(); 
String file1 = (String)files.nextElement(); 
filename1 = multi.getFilesystemName(file1); 
} catch(Exception e) { 
e.printStackTrace(); 
} 
 
String fullpath = "images\\" + filename1; 
%> 
<title>프로필 사진</title>
<style>
 img{ 
	float: left;
    clear: both;
    border: 4px solid #adadad; 
 	border-radius: 30%; 
 	overflow: hidden;
 }
</style>
</head> 
<body> 
	<img src="<%=fullpath%>" width=200px height=200px></img> 
</body> 
</html>