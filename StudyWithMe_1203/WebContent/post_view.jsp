<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="beans.model.BoardDAO" %>
<%@ page import="beans.bean.BoardDTO" %>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE HTML>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <title>post2</title>
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
      font-size: 20px;
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
    a{
        border: 1px solid #adadad;
        height:32px;
        border-radius:7px;
        padding:0px 2px 0px;
    }
  </style>
</head>
<body>
    <% int value = Integer.parseInt(request.getParameter("value")); %>
    <jsp:useBean id="boardBean" class="beans.bean.BoardDTO" /> 
    <jsp:setProperty name="boardBean" property="num" value="<%=value %>" />
	<%
	    BoardDAO dao=BoardDAO.getInstance();
	    BoardDTO dto=dao.readBoard(boardBean);
    %>

<div class="container">
<iframe src="headerAndNavi.jsp" width = "1700px" height = "1000px" scrolling = "no" frameborder ="0" style="margin-left:-280px"></iframe>
	<h1 align="center"><b><%= dto.getSubject() %></b></h1>
	<hr width="1200px" style="border:solid 1px #adadad">
	<table width=1200px height=500px>
	<tr>
		<td><h3><b>[<%= dto.getHead() %>] <%= dto.getTitle() %></b></h3></td>
	</tr>
	<tr>
		<td>
		<article><%= dto.getText() %></article>
        </td>
    </tr>
    <tr>
        <td align="center">
            <a class="btn btn-default pull-right" href= "boardList.jsp?value=1">목록</a>
        <% if( dto.getUser().equals(session.getAttribute("sessionID")) )  {%>
            <a class="btn btn-default" href = "post_modify.jsp?value=<%= dto.getNum() %>">수정</a>
            <a class="btn btn-default" href = "post_delete.jsp?value=<%= dto.getNum() %>">삭제</a>
        </td>
        <% } %>
    </tr>
</table>
   <iframe src="footer.jsp" width = "1200px" height = "200px" scrolling = "no" frameborder ="0" style="bottom:-30px;"></iframe>
   </div>
	 
</body>
</html>