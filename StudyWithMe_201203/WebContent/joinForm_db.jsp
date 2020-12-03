<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="beans.model.UserDAO" %>
<%@ page import="beans.bean.UserDTO" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %> 

<jsp:useBean id="userBean" class="beans.bean.UserDTO" />
<jsp:setProperty name="userBean" property="*" />
<%	
	String id = request.getParameter("id");
	UserDAO dao = UserDAO.getInstance();
	UserDTO dto = dao.getData(id);
	if(dto.getId() != null) {
	%>
	<script>
		window.alert("이미 존재하는 아이디입니다.");
		window.location.replace("loginForm.jsp");
    </script>
	<%
	}else {
		dao.signUp(userBean);

		response.sendRedirect("loginForm.jsp");
	}
%>