package beans.model;

import java.util.ArrayList;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.bean.*;

public class FeedDAO {
	private static FeedDAO instance;
	public static String driver = "com.mysql.jdbc.Driver";
	public static String jdbcurl = "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";

	private FeedDAO() {
	}

	public static FeedDAO getInstance() {
		if (instance == null)
			instance = new FeedDAO();

		return instance;
	}

	public ArrayList<FeedDTO> showFeed(String id, Boolean type) {
		ArrayList<FeedDTO> list = new ArrayList<FeedDTO>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String query = "";

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			if (type)
				query = "select * from feed where id=? and not pic='' order by upload_date desc";
			else
				query = "select * from feed where not id=? and not pic='' order by rand()";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, id);
			rs = pstm.executeQuery();

			while (rs.next()) {
				FeedDTO dto = new FeedDTO();
				dto.setNum(Integer.parseInt(rs.getString("num")));
				dto.setId(rs.getString("id"));
				dto.setPic(rs.getString("pic"));
				dto.setText(rs.getString("text"));
				dto.setUpload_date(rs.getString("upload_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException s) {
			}
			try {
				conn.close();
			} catch (SQLException s) {
			}
			try {
				rs.close();
			} catch (SQLException s) {
			}
		}
		return list;
	}
	
	public FeedDTO uploadFeed(String id, String url, String text) {
		FeedDTO dto = new FeedDTO();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "insert into feed (id, pic, text, upload_date) values (?,?,?,NOW())";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, id);
			pstm.setString(2, url);
			pstm.setString(3, text);
			
			System.out.println("text : " + text);
			pstm.executeUpdate();

			query = "select num from feed order by num desc;";
			rs = pstm.executeQuery(query);
			rs.next();

			dto.setNum(Integer.parseInt(rs.getString("num")));
			dto.setId(rs.getString("id"));
			dto.setPic(rs.getString("pic"));
			dto.setText(rs.getString("text"));
			dto.setUpload_date("upload_date");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException s) {
			}
			try {
				conn.close();
			} catch (SQLException s) {
			}
		}
		return dto;
	}
	
	public FeedDTO viewFeed(int num) {
		FeedDTO dto = new FeedDTO();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "select * from feed where num=?";
			pstm = conn.prepareStatement(query);

			pstm.setInt(1, num);

			rs = pstm.executeQuery();
			rs.next();

			dto.setNum(Integer.parseInt(rs.getString("num")));
			dto.setId(rs.getString("id"));
			dto.setPic(rs.getString("pic"));
			dto.setText(rs.getString("text"));
			dto.setUpload_date("upload_date");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException s) {
			}
			try {
				conn.close();
			} catch (SQLException s) {
			}
		}
		return dto;
	}
	
	public void deleteFeed(int num) {
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "delete from feed where num=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, num);
			
			pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstm.close();
			} catch (SQLException s) {
			}
			try {
				conn.close();
			} catch (SQLException s) {
			}
		}
	}
}
