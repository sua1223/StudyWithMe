<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<title>Insert title here</title> 
<style>
#container { width : 250px; height : 400px;  border : 1px solid;}
</style>
</head> 
	<div id = "container" ></div>
	<form method="post" enctype="multipart/form-data" action="timetableImg.jsp"> 
		<input type="file" name="filename1" size=20> 
		<br>
		<input type="submit" value = "시간표등록"><br><br> 
	</form> 
<body> 
</body> 
</html>