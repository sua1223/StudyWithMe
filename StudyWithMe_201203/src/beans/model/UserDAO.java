package beans.model;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import beans.bean.*;

public class UserDAO {
    private static UserDAO instance;
    public static String driver = "com.mysql.jdbc.Driver";
    public static String jdbcurl = "jdbc:mysql://localhost:3306/sampledb?serverTimezone=UTC";

    private UserDAO() {
    }

    public static UserDAO getInstance() {
        if (instance == null)
            instance = new UserDAO();

        return instance;
    }

    public void signUp(UserDTO bean) {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "insert into user_info (id, pw, e_mail, school, major) values (?,?,?,?,?)";
            pstm = conn.prepareStatement(query);

            pstm.setString(1, bean.getId());
            pstm.setString(2, bean.getPw());
            pstm.setString(3, bean.getE_mail());
            pstm.setString(4, bean.getSchool());
            pstm.setString(5, bean.getMajor());

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

    public Boolean loginCheck(String id, String pw) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "select * from user_info where id=? and pw=?";
            pstm = conn.prepareStatement(query);

            pstm.setString(1, id);
            pstm.setString(2, pw);

            rs = pstm.executeQuery();
            if (rs.next())
                return true;
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
        return false;
    }

    public UserDTO getData(String id) {
        UserDTO dto = new UserDTO();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "select * from user_info where id=?";
            pstm = conn.prepareStatement(query);

            pstm.setString(1, id);

            rs = pstm.executeQuery();
            rs.next();

            dto.setId(rs.getString("id"));
            dto.setE_mail(rs.getString("e_mail"));
            dto.setSchool(rs.getString("school"));
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
        return dto;
    }
    
    public String getPath(String id, String type) {
        String path = "";
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "select " + type + " from user_info where id=?";
            pstm = conn.prepareStatement(query);

            pstm.setString(1, id);

            rs = pstm.executeQuery();
            rs.next();

            path = rs.getString(type);
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

        return path;
    }
    
    public void uploadPath(String id, String url, String type) {
        Connection conn = null;
        PreparedStatement pstm = null;

        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(jdbcurl, "root", "0814");
            String query = "update user_info set " + type + "=? where id=?";
            pstm = conn.prepareStatement(query);

            pstm.setString(1, url);
            pstm.setString(2, id);

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
