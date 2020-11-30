<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import = "util.*" %>
<% response.setHeader("P3P","CP='CAO PSA CONi OTR OUR DEM ONL'"); %>
<%!
public static int[] makeGarden(ResultSet rs){
		
		int days[] = new int[365];
		for (int i = 0 ; i < 365 ; i++)
			days[i] = 0;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("01",0);
		map.put("02",31);
		map.put("03",(31+28));
		map.put("04",(31+28+31));
		map.put("05",(31+28+31+30));
		map.put("06",(31+28+31+30+31));
		map.put("07",(31+28+31+30+31+30));
		map.put("08",(31+28+31+30+31+30+31));
		map.put("09",(31+28+31+30+31+30+31+31));
		map.put("10",(31+28+31+30+31+30+31+31+30));
		map.put("11",(31+28+31+30+31+30+31+31+30+31));
		map.put("12",(31+28+31+30+31+30+31+31+30+31+30));
	
		
		try {
			/*
			 * rs.last(); int row = rs.getRow(); rs.beforeFirst(); System.out.println("row "
			 * + row);
			 */
			
			while(rs.next()) 
	        {
				String Dates = rs.getString(1);
				String month = Dates.substring(0, 2);
				int day = Integer.parseInt( Dates.substring(2, 4));
				System.out.println("month : "+month+ ", day :" + day);
				int start_index = map.get(month);
				days[start_index + day] = days[start_index + day] + 1;
	        }
			
		} catch(Exception e) { e.printStackTrace(); }
		
		for (int i = 0 ; i < 365 ; i++)
		{
			if(days[i] > 4)
				days[i] = 4;
		}
		
		System.out.println("day" + days[1]);
		return (days);
	}
 %>

<html>
<head>
	<meta charset = "utf-8">
	<link rel = "stylesheet" type = "text/css" href = "garden.css?ver=1.1">
</head>

<body>
<div class="graph">
    <ul class="months">
      <li>Jan</li>
      <li>Feb</li>
      <li>Mar</li>
      <li>Apr</li>
      <li>May</li>
      <li>Jun</li>
      <li>Jul</li>
      <li>Aug</li>
      <li>Sep</li>
      <li>Oct</li>
      <li>Nov</li>
      <li>Dec</li>
    </ul>
    <ul class="days">
      <li>Sun</li>
      <li>Mon</li>
      <li>Tue</li>
      <li>Wed</li>
      <li>Thu</li>
      <li>Fri</li>
      <li>Sat</li>
    </ul>
    
    <ul class="squares">
	<script type="text/javascript">
		const squares = document.querySelector('.squares');
<%
Statement stmt = null;
ResultSet rs = null;	
Connection conn =null;
int array[];

try {
   	Class.forName("com.mysql.jdbc.Driver");
   	} catch (ClassNotFoundException e) {
   		System.err.print("ClassNotFoundException :");
   	}

   	
   	
   	try{
   		
   		String jdbcurl= "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";
   		conn = DriverManager.getConnection(jdbcurl , "root","0814");
   		String query= "SELECT DATE_FORMAT(upload_date, '%m%d') AS substr_upload_date from feed where id = ? ";
   		//stmt = conn.createStatement();
   		PreparedStatement ps = conn.prepareStatement(query);
   		ps.setString(1, (String)session.getAttribute("sessionID"));
   		
   		System.out.println("id " + (String)session.getAttribute("sessionID"));
		rs=ps.executeQuery();
		
		array = makeGarden(rs);

	   	for(int i = 0 ; i < 364 ; i++)
	   	{
			out.println("squares.insertAdjacentHTML('beforeend', `<li data-level="+ array[i] + "></li>`);");
			if(array[i] > 0)
				System.out.println(i + "=" + array[i]);
	   	}
   	
   	} catch (SQLException e) {
   	} catch (Exception ex) {}
%>
	</script>
	</ul>
	<div class = "LessMore">
        <ul class = "legend">
            <li style="background-color: #ebedf0"></li>
            <li style="background-color: #B8BCFF"></li>
            <li style="background-color: #8F93C7"></li>
            <li style="background-color: #72759E"></li>
         </ul>
	</div>
</div>
</body>
</html>