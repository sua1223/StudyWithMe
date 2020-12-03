package beans.model;

import java.util.ArrayList;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.bean.*;

public class CommentDAO {
    private static CommentDAO instance;
	public static String driver = "com.mysql.jdbc.Driver";
	public static String jdbcurl = "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";

	private CommentDAO() {
	}

    public static CommentDAO getInstance() {
        if (instance == null)
            instance = new CommentDAO();

        return instance;
    }
    
    public ArrayList<CommentDTO> showComment(int post_num) {
		ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "select * from comment where post_num=? order by date asc";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1,post_num);
			
			rs = pstm.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();
                dto.setId(rs.getInt("id"));
                dto.setPost_num(rs.getInt("post_num"));
				dto.setText(rs.getString("text"));
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
    
    public void uploadComment(CommentDTO bean) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        System.out.println("tqtq");
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "insert into comment (post_num, text, user, date) values (?,?,?,NOW())";
            pstm = conn.prepareStatement(query);
            System.out.println("tqtq");
            pstm.setInt(1, bean.getPost_num());
            pstm.setString(2, bean.getText());
            pstm.setString(3, bean.getUser());

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

    public void deleteComment(int id) {
        Connection conn = null;
		PreparedStatement pstm = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "delete from comment where id=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, id);
			
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
