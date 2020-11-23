<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
	<meta charset="utf-8">
  <title>post2</title>
	<style type="text/css">
		body {
      text-align: center;
		  color: #000000;
		  width: 1200px;
    }
		div#wapper {
      width: 100%;
			min-height: 300px;
			text-align: left;
			margin: 0 auto;
    }
		header, footer, nav, section {
      border-radius:10px;
      border: 1px solid #000000;
			margin: 5px;
			padding: 10px;
    }
		header {
      height: 50px;
      background-color: #85ACD8;
    }
		nav, section {
      float: left;
      height: 500px;
    }
		nav {
      background-color: #85ACD8;
      width: 150px;
    }
		section {
      background-color: #E2EEFE;
      width: 1010px;
    }
    footer {
      height: 50px;
    	background-color: #85ACD8;
    	position: relative;
    	clear: both;
    }
    article {
      border-radius:10px;
      position:relative;
      width: 97%;
      height:90%;
    	margin:4px;
      padding:0px 5px 1px;
    	background-color: #C2D3EA;
    }
    form{
      position:absolute;
      bottom:10px;
    }
  </style>
</head>
<body>
    <div id="wapper">
    		<header><p>header</p></header>
    		<nav>
    			<b>자주가는 게시판</b>
          <hr style="border:solid 1px #000000">
    			<ul>
    				<li><a href="">시스템소프트웨어</a></li>
    				<li><a href="">웹 프로그래밍</a></li>
    				<li><a href="">심화 프로그래밍</a></li>
    			</ul>
    		</nav>
<%
	String title=request.getParameter("title");
	String main_text=request.getParameter("main_text");
	String boards=request.getParameter("boards");
	String head=request.getParameter("head");
%>
    	<section>
    		<h2 align="center"><%=boards %></h2>
    		<form action="boardList.jsp" method="post">
    		<input style="width:70px" type="submit" name="" value="목록">
    		</form><br>
    		<b>[<%=head %>] <%=title %></b>
    		<article><p><%=main_text %></p>
            <img src="dog.jpg" alt="멍멍" width="300px" height="260px"/>
            	<form>
              <hr style="border:dashed 2px #79ADF5">
              <textarea style="border-radius:7px" name = "col"  rows = "2"  cols = 90% ></textarea><br>
                <input style="border-radius:7px" type = "submit"  value = "답글">
                </form>
          	</article>
    	</section>
    	<footer>footer</footer>
    </div>
</body>
</html>