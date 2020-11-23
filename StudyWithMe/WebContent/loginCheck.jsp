<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	PreparedStatement stmt = null;
	ResultSet rs = null;	
	
    String dbPW = ""; // db에서 꺼낸 비밀번호를 담을 변수
    int x = -1;
    
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql:"
				+ "//localhost:3306/member?serverTimezone=UTC", "root","0814");
		
		String sql = "SELECT * FROM member WHERE ID=?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, id);
		rs = stmt.executeQuery();
		
		if (rs.next()) // 입려된 아이디에 해당하는 비번 있을경우
        {
            dbPW = rs.getString("password"); // 비번을 변수에 넣는다.

            if (dbPW.equals(pw)) 
                x = 1; // 넘겨받은 비번과 꺼내온 배번 비교. 같으면 인증성공
            else                  
                x = 0; // DB의 비밀번호와 입력받은 비밀번호 다름, 인증실패
            
        } else {
            x = -1; // 해당 아이디가 없을 경우
        }
		
		String msg = "";
		
		if(x == 1) { //login success
			session.setAttribute("sessionID", id);
			msg = "main.jsp";
		}
		else if(x == 0){ //incorrected pw
			msg = "loginForm.jsp?msg=0";
		}
		else{ //incorrected id
			msg = "loginForm.jsp?msg=-1";
		}
		
		System.out.println("DB 연결 완료");
		
		response.sendRedirect(msg);
		
	} catch(ClassNotFoundException e) {
		System.out.println("JDBC 드라이버 로드 에러");
	} catch(SQLException e) {
		System.out.println("DB 연결 에러");
	}
	
%>