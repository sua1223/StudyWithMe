<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
    
	<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn =null;
	Statement stmt = null;
	
	String user_ID = request.getParameter("id");
    String user_Email = request.getParameter("email");
    String user_School = request.getParameter("school");
    String user_Major = request.getParameter("major");
    String user_Pw = request.getParameter("pw");
   	

   	try {
   	Class.forName("com.mysql.jdbc.Driver");
   	} catch (ClassNotFoundException e) {
   		System.err.print("ClassNotFoundException :");
   	}
   	
	try{
	
		String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		String query = "insert into user_info (id, pw, e_mail, school, major) values ('" + user_ID + "','" + user_Pw + "','" + user_Email + "','" + user_School + "','" + user_Major  + "')";
		
		conn = DriverManager.getConnection(jdbcurl,"root","0814");
		stmt = conn.createStatement();
		stmt.executeUpdate(query);
	
	} finally
	{
		if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
		if (conn != null) try { conn.close();} catch(SQLException ex) {}
	}
	
	response.sendRedirect("loginForm.jsp");
   %>
   
   
   