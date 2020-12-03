<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.FeedDAO" %>
<%@ page import="beans.bean.FeedDTO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<style>
   ::-webkit-scrollbar{width: 16px;}
   ::-webkit-scrollbar-track {background-color:#ffffff;}
   ::-webkit-scrollbar-thumb {background-color:#ffffff;border-radius: 10px;}
   ::-webkit-scrollbar-thumb:hover {background: #ffffff;}
   ::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {width:16px;height:16px;background:#ffffff;}
      .container{
        width:1120px;
        height:850px;
        border:1px solid #dedede;
        border-radiuds:7px;
        }
        filebox label,input {
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
   .box{
      background-color:#7D9CDB;
      width:120px;
      height:40px;
      border:none;
      border-radius:7px;
      padding-top:10px;
   }
   .box a{
      color: white;
         text-align: center; 
         text-decoration: none; 
         
      }
</style>
<title>Insert title here</title>
</head>
<body class="is-preload" style="background-color:transparent;">
   <div class="container">
      <div id="main">
         <div class="inner" align="center">
      
      <%
      int value = Integer.parseInt(request.getParameter("value"));
      FeedDAO dao = FeedDAO.getInstance();
      FeedDTO dto = dao.viewFeed(value);

        if( dto.getId().equals((String)session.getAttribute("sessionID"))) { %>
            <span class="image main"><img src=" <%= dto.getPic() %>" alt="" style="margin-top:50px;" width="600px" height="600px;"/></span>     
            <br><h3 align="center"><%= dto.getText()%> </h3>
            <hr width = "600px" style = "margin-top : -10px;" >
            <div class="box" style="box-sizing: border-box; float:left; margin-left:435px; margin-top:10px;">
               <b><a href="profilePageLayout.jsp" target="_parent" >MY FEED</a></b>
            </div>
            
            <div class="box" style="box-sizing: border-box; float:left; margin-left:8px; margin-top:10px;">
               <b><a href ="feed_delete.jsp?value=<%= dto.getNum() %>">삭제</a></b>
            </div>
      <%} else {%>   
            <span class="image main"><img src=" <%= dto.getPic() %>   " alt="" style="margin-top:30px;" width="600px" height="600px;"/></span> 
            <h3 style = "margin-top:0px; margin-left:-440px;">[<%= dto.getId() %>] </h3>   
                <hr width = "600px" style = "margin-top : 10px;" >    
            <h3 align="center"><%= dto.getText() %> </h3>
            <hr width = "600px" >
            <div class="box" style="box-sizing: border-box; float:left; margin-left:500px; margin-top:10px;">
               <b><a href="othersfeed.jsp" id="feed" class="primary">Others FEED</a></b>
            </div>
      <% }
      %>
            </div>
         </div>
      </div>
   </body>
</html>