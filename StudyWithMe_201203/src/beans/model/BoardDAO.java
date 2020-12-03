package beans.model;

import java.util.ArrayList;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.bean.*;

public class BoardDAO {
	private static BoardDAO instance;
	public static String driver = "com.mysql.jdbc.Driver";
	public static String jdbcurl = "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();

		return instance;
	}

	public BoardDTO uploadBoard(BoardDTO bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "insert into board (head, subject, title, text, user, date) values (?,?,?,?,?,NOW())";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, bean.getHead());
			pstm.setString(2, bean.getSubject());
			pstm.setString(3, bean.getTitle());
			pstm.setString(4, bean.getText());
			pstm.setString(5, bean.getUser());

			pstm.executeUpdate();
			query = "select num from board order by num desc;";
			rs = pstm.executeQuery(query);
			rs.next();
			bean.setNum(Integer.parseInt(rs.getString("num")));
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

		return bean;
	}

	public ArrayList<BoardDTO> showBoardList() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "select * from board order by num desc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(Integer.parseInt(rs.getString("num")));
				dto.setSubject(rs.getString("subject"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setUser(rs.getString("user"));
				dto.setDate(rs.getString("date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
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

	public ArrayList<BoardDTO> searchBoardList(String category, String word) {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "select * from board where " + category + " like ? order by num desc";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, "%" + word + "%");

			rs = pstm.executeQuery();
			
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(Integer.parseInt(rs.getString("num")));
				dto.setSubject(rs.getString("subject"));
				dto.setHead(rs.getString("head"));
				dto.setTitle(rs.getString("title"));
				dto.setUser(rs.getString("user"));
				dto.setDate(rs.getString("date"));
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

	public BoardDTO modifyBoard(BoardDTO bean) {
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "update board set head=?, subject=?, title=?, text=?, date=NOW() where num=?";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, bean.getHead());
			pstm.setString(2, bean.getSubject());
			pstm.setString(3, bean.getTitle());
			pstm.setString(4, bean.getText());
			pstm.setInt(5, bean.getNum());

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
		return bean;
	}
	
	public BoardDTO readBoard(BoardDTO bean) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "select * from board where num=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, bean.getNum());
			
			rs = pstm.executeQuery();
			rs.next();
			
			bean.setHead(rs.getString("head"));
			bean.setSubject(rs.getString("subject"));
			bean.setTitle(rs.getString("title"));
			bean.setText(rs.getString("text"));
			bean.setUser(rs.getString("user"));
			bean.setDate(rs.getString("date"));
			
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
		return bean;
	}
	
	public void deleteBoard(BoardDTO bean) {
		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "delete from board where num=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, bean.getNum());
			
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
