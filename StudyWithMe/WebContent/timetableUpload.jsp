<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<style>
		.filebox label,input {
			margin-top:5px;
 			display: inline-block;
  			padding: .5em .75em;
  			color: #fff;
  			font-size: inherit;
  			line-height: normal;
  			vertical-align: middle;
  			background-color: #7D9CDB;
  			cursor: pointer;
  			border: 1px solid #ffffff;
  			border-radius: .25em;
  			-webkit-transition: background-color 0.2s;
  			transition: background-color 0.2s;
		}

		.filebox label:hover {
 			background-color: #7AB1EC;
		}
		input:hover {
 			background-color: #7AB1EC;
		}

		.filebox label:active {
  			background-color: #4691E0;
		}
		input:active {
  			background-color: #4691E0;
		}

		.filebox input[type="file"] {
  			position: absolute;
  			width: 1px;
  			height: 1px;
 			padding: 0;
  			margin: -1px;
  			overflow: hidden;
  			clip: rect(0, 0, 0, 0);
  			border: 0;
		}
	</style>
<title>시간표 올리기</title> 
<style>
#container { width : 270px; height : 420px;  border : 1px solid;}
</style>
</head> 
	<div id = "container" ></div>
	<form method="post" enctype="multipart/form-data" action="timetableImg.jsp"> 
		<div class="filebox">
		    <label for="exfile" style="margin-left:30px;">업로드</label>
			<input type="file" id="exfile" name="filename1" size=20>
			<input type="submit" value = "시간표등록"><br><br> 
		</div>
	</form> 
<body> 
</body> 
</html>