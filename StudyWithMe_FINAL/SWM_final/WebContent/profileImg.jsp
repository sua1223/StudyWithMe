<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="utf-8"%> 
<%@ page import="java.sql.*" %>
<%@ page import="beans.model.UserDAO" %>
<%@ page import="beans.bean.UserDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"> 
<style>
   .filebox label,input{
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
</head> 
<body> 
<% 
   String id = (String)session.getAttribute("sessionID");
   UserDAO dao = UserDAO.getInstance();
   String url = dao.getPath(id, "profile_url");

   if (url == null) 
      url = "images/blank-profile.png";
%>
   <img style="border-radius:30%;" src = "<%= url %>" width = "210px" height = "210px" />
   <form method="post" enctype="multipart/form-data" action="profileImg_db.jsp"> 
      <div class="filebox">
         &nbsp;&nbsp;<label style="margin-left:0px;" for="exfile">업로드</label>
         <input type="file" id="exfile" name="filename" size=20>
         <input type="submit" value = "프로필 등록">
      </div>
   </form> 
</body> 
</html>