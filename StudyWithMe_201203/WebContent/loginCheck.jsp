<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="beans.model.UserDAO" %>
<%@ page import="beans.bean.UserDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
    
    if(id == null  || pw == null ) {
%> 
	<script>
		alert("invaild user info.")
		window.location.replace("loginForm.jsp");
	</script>
<%
	}
		UserDAO dao = UserDAO.getInstance();
    	Boolean loginResult = dao.loginCheck(id, pw);

		if(loginResult) {
			session.setAttribute("sessionID", id);
			response.sendRedirect("mainPage.jsp");
		} else 
%>
	<script>
		alert("ID or Password is invalid");
		window.location.replace("loginForm.jsp");
    </script>
	