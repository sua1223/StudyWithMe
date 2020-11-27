<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>
</head>
<body>
    <%
	Connection conn =null;
	Statement stmt= null;
	ResultSet rs= null;
    int value = Integer.parseInt(request.getParameter("value"));
	
	try{
	String driver="com.mysql.jdbc.Driver";
	Class.forName(driver);
	
	String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		
	conn=DriverManager.getConnection(jdbcurl,"root","0814");
	
	System.out.println("DB 접속 성공");
	
	String query = "select * from board where num = '" + value + "'";
	stmt=conn.createStatement();
	rs = stmt.executeQuery(query);
	rs.next();

	query = "delete from board where num = '" + value + "'";
	stmt.executeUpdate(query);
    
    response.sendRedirect("boardList.jsp?value=1");
   
    }catch(ClassNotFoundException e){
        System.out.println("JDBC 드라이버 로드 에러");
        e.printStackTrace();
    }catch(SQLException sqle){
        System.out.println("SQL 실행 에러");
    }
    stmt.close();
    conn.close();
    %>
</body>
</html>