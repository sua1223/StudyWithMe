<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   <title>게시판 화면</title> 
   <style type="text/css">
    *{
     	font-family:sans-serif;
    }
    table{
        padding: 10px 0px 30px;
        margin-bottom:200px;
    }
    tr, td {
        height:55px;
        border: 1px solid #adadad;
        padding: 0px 7px 0px;
        background-color:#ffffff;
    }
    article {
      white-space:pre;
      border-radius:7px;
      position:relative;
      width: 97%;
      height:500px;
      margin:8px;
      padding:5px 3px 3px 5px;
      background-color: #ffffff;
      white-space:pre;
    }
    input{
        border: 1px solid #adadad;
        height:32px;
        border-radius:7px;
        padding:0px 2px 0px;
    }
  </style>
</head>
<body>
<%
   String title=request.getParameter("title");
   String main_text=request.getParameter("main_text");
   String boards=request.getParameter("boards");
   String head=request.getParameter("head");
%>
<iframe src="headerAndNavi.html" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0"></iframe>        
<div class="container">
	<h1 align="center"><%=boards %></h1>
	<hr width="1200px"style="border: solid 1px #adadad" >
	<table width=1200px height="500px">
	<tr>
		<td><h3>[<%=head %>] <%=title %></h3></td>
	</tr>
	<tr>
		<td>
		<article><%=main_text %></article>
        </td>
    </tr>
    <tr>
    	<td align="center">
    	<form action="boardList.jsp" method="post">
             <input style="width:70px" type="submit" name="" value="목록">
             <input style="width:70px" type="submit" name="" value="삭제">
        </form>
        </td>
    </tr>
</table>
<iframe src="footer.jsp" width = "1200px" height = "200px" scrolling = "no" frameborder ="0"></iframe>
</div>
</body>
</html>