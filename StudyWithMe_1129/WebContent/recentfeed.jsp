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
   .feedButton div.btn_wrap span { margin-left: 170px; margin-top:-8px;position:absolute; left:100px; top:10px; display:block; width:60px; height:30px; line-height:30px; background:#333; font-size:11px; color:#fff; text-align:center; border:0; border-radius:3px;}
 
  	::-webkit-scrollbar{width: 16px;}
	::-webkit-scrollbar-track {background-color:#ffffff;}
	::-webkit-scrollbar-thumb {background-color:#ffffff;border-radius: 10px;}
	::-webkit-scrollbar-thumb:hover {background: #ffffff;}
	::-webkit-scrollbar-button:start:decrement,::-webkit-scrollbar-button:end:increment {
	width:16px;height:16px;background:#ffffff;}
}
</style>
<meta charset="UTF-8">
	<link rel = "stylesheet" type = "text/css" href = "recentfeed.css">

<title>Insert title here</title>
</head>
<body>
<br><br>
      <div class="feedButton">
   		<div class="btn_wrap">
		<div style="width:300px">
   		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="5px"><b>My Recent Feed</b></font>
   		 </div>
      <span>
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
			
			String query="select * from feed where id = '" + session.getAttribute("sessionID") + "' order by num desc";
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
		   	
		   	<div >
           <article class="style<%=n%>">
           <span class="image">
           <img src= <%= rs.getString("pic") %> alt="" />
           </span>
                  </article> 
    
       	  <a href="feed_view.jsp?num=<%=rs.getString("num")%>"></a>
     	
	</div>
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
  </body>
</html>