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
    
    public void uploadComment(CommentDTO bean) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "insert into comment (post_num, text, user, date) values (?,?,?,NOW())";
            pstm = conn.prepareStatement(query);

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

    public void deleteComment(CommentDTO bean) {
        Connection conn = null;
		PreparedStatement pstm = null;

		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(jdbcurl, "root", "0814");
			String query = "delete from board where id=?";
			pstm = conn.prepareStatement(query);
			
			pstm.setInt(1, bean.getId());
			
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
