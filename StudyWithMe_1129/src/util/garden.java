package util;

import java.util.*;
import java.sql.*;

public class garden {

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
				String Dates = rs.getString(0);
				String month = Dates.substring(0, 2);
				int day = Integer.parseInt( Dates.substring(2, 3));
				System.out.println("month : "+month+ ", day :" + day);
				int start_index = map.get(month);
				days[start_index+day] = 1;
	        }
			
		} catch(Exception e) { e.printStackTrace(); }
		

		return (days);
	}
}
