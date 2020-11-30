<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
<!DOCTYPE html>
<html>
<head>
<head> 
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel = "stylesheet" type = "text/css" href = "profilePageLayout.css?ver=1.1">
    <script type="text/javascript">
    	function goJoinForm() {
    		location.href="joinForm.jsp";
		}
    	function goLoginForm() {
        	location.href="loginForm.jsp";
    	}
    </script>
   <style type="text/css">
   		input{
   			width:200px;
   			height:100px;
   		}
   		input.img-button-1 {
        background: url( "images/signUp_button.png" ) no-repeat;
        border: none;
        width: 250px;
        height: 70px;
        cursor: pointer;
      }
      input.img-button-2 {
        background: url( "images/signIn_button.png" ) no-repeat;
        border: none;
        width: 250px;
        height: 70px;
        cursor: pointer;
      }
   </style>
</head> 
<title>login or signUp</title>
</head>
<body>
	<div class="frame" style="width:1700px; margin:auto;" >
	<div class = "nav"> 
       <a href="mainPage.jsp" target="_parent">Home</a>
      <a href="about.jsp" target="_parent">About</a>
      <a href="profilePageLayout.jsp" target="_parent">Profile</a>
      <a href="boardList.jsp?value=1" target="_parent">Board</a>
   </div> 
   <div class = "header"> 
   		<input type="button" class="img-button-1" style="margin-top:650px;" onClick="goJoinForm()">
   		<input type="button" class="img-button-2" style="margin-top:650px;" onClick="goLoginForm()">
   </div> 
   <br><br>
   <iframe src="footer.jsp" width="1700px" height="200px" scrolling = "no" frameborder="0" style="clear:both;"></iframe>
   </div>
</body>
</html>