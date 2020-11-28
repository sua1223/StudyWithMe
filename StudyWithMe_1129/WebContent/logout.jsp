<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


<% session.invalidate(); %>
	
<script>
	alert("Logout 되었습니다.");
	window.location.replace("loginForm.jsp");
</script>

<!-- response.sendRedirect("loginForm.jsp");	--> 	