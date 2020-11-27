<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<style>
		.filebox label {
 			display: inline-block;
  			padding: .5em .75em;
  			color: #fff;
  			font-size: inherit;
  			line-height: normal;
  			vertical-align: middle;
  			background-color: #5cb85c;
  			cursor: pointer;
  			border: 1px solid #4cae4c;
  			border-radius: .25em;
  			-webkit-transition: background-color 0.2s;
  			transition: background-color 0.2s;
		}

		.filebox label:hover {
 			background-color: #6ed36e;
		}

		.filebox label:active {
  			background-color: #367c36;
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
#container { width : 250px; height : 400px;  border : 1px solid;}
</style>
</head> 
	<div id = "container" ></div>
	<form method="post" enctype="multipart/form-data" action="timetableImg.jsp"> 
		<div class="filebox">
		    <label for="exfile">업로드</label>
			<input type="file" id="exfile" name="filename1" size=20>
			<input type="submit" value = "시간표등록"><br><br> 
		</div>
	</form> 
<body> 
</body> 
</html>