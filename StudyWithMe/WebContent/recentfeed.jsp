<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.* " %>
<%
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel = "stylesheet" type = "text/css" href = "recentfeed.css">

<title>Insert title here</title>
</head>
<body class="is-preload">
                        
                        			   <%
	   
		Connection conn =null;
		Statement stmt= null;
		ResultSet rs= null;
		
		try{
			String driver="com.mysql.jdbc.Driver";
			Class.forName(driver);
			
			String jdbcurl="jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
				
			conn=DriverManager.getConnection(jdbcurl,"root","knight337");
			
			System.out.println("DB 접속 성공");
			
			String query="select * from feed order by num desc";
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

    <!--               <article class="style2">
                     <span class="image">
                        <img src="pic02.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  <article class="style3">
                     <span class="image">
                        <img src="pic03.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  <br>

                  <article class="style4">
                     <span class="image">
                        <img src="pic04.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  <article class="style5">
                     <span class="image">
                        <img src="pic05.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  <article class="style6">
                     <span class="image">
                        <img src="pic06.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  
                  
                  <article class="style7">
                     <span class="image">
                        <img src="pic07.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a>
                  </article>
                  
                  <article class="style8">
                     <span class="image">
                        <img src="pic08.jpg" alt="" />
                     </span>
                     <a href="generic.jsp"></a> -->
                     
<!--                   </article>
 -->                  
               </section>
            </div>
         </div>
         </div>
      </form>
  </body>
</html>