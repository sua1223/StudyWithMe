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
	
	try{
	String driver="com.mysql.jdbc.Driver";
	Class.forName(driver);
	
	String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
		
	conn=DriverManager.getConnection(jdbcurl,"root","0814");
	
	System.out.println("DB 접속 성공");
	
	String subject=request.getParameter("subject");
	String head=request.getParameter("head");
	String title=request.getParameter("title");
	String text=request.getParameter("text");
	String query = "insert into board (head, subject,title, text, user, date) values ('" + head+ "','" + subject + "','" + title + "','" + text + "','" + session.getAttribute("sessionID") + "'," + "NOW() )";
	stmt=conn.createStatement();
	stmt.executeUpdate(query);

    query = "select num from board order by num desc;";
    rs = stmt.executeQuery(query);   
    rs.next();
    
    String redirect_url="post_view.jsp?value=" +rs.getString("num");
    response.sendRedirect(redirect_url);
   
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