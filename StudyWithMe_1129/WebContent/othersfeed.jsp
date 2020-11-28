<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
   <style type="text/css">
   a{text-decoration:none}
   .feedButton { width:60px; height:30px;}
   .feedButton div.btn_wrap { position:relative; float:right; width:60px; height:30px;  }
   .feedButton div.btn_wrap span { position:absolute; left:100px; top:10px; display:block; width:60px; height:30px; line-height:30px; background:#333; font-size:11px; color:#fff; text-align:center; border:0; border-radius:3px; -webkit-border-radius:3px; cursor:pointer; }

</style>
<meta charset="UTF-8">
	<link rel = "stylesheet" type = "text/css" href = "recentfeed.css">

<title>Insert title here</title>
</head>
<body>
      <div class="feedButton">
   <div class="btn_wrap">
      <span>
         <a href="makeFeed.jsp" style="color:white">UPLOAD</a>
         <a href="makeFeed.jsp" style="color:white">UPLOAD</a>
					
				</span>
		  </div>
		</div>                     
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
			
			String query="select * from feed where NOT id = '" + session.getAttribute("sessionID") + "' order by num desc";
			stmt=conn.createStatement();
			rs=stmt.executeQuery(query);
			%>


		      <div id="wrapper">
		         <div id="main">
		            <div class="inner">
		               <section class = "tiles">
               
	        <% 
	        int n=1;
		   	while(rs.next()){
		   	%>
		   	
           <article class="style<%=n%>">
           <span class="image">
           <img src= <%= rs.getString("pic") %> alt="" />
           </span>
                   
    
         <a href="feed_view.jsp?num=<%=rs.getString("num")%>"></a>
      </article>

     <%
	   	}
		}catch(ClassNotFoundException e){
			System.out.println("JDBC 드라이버 로드 에러");
			e.printStackTrace();
		}catch(SQLException sqle){
			System.out.println("SQL 실행 에러");
		}
	   	stmt.close();
	   	conn.close();
	   %>
               </section>
            </div>
         </div>
         </div>
      </form>
  </body>
</html>