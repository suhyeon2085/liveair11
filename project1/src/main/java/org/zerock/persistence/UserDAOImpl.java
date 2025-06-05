package org.zerock.persistence;

import java.sql.*;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemberDTO;
	

// DB 연결
@Repository
public class UserDAOImpl implements UserDAO {


    private static final String URL = "jdbc:mysql://localhost:3306/your_database?useSSL=false&serverTimezone=UTC";
    private static final String DB_USER = "your_user";
    private static final String DB_PASSWORD = "your_password";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("JDBC 드라이버 로드 실패", e);
        }
    }

    //회원가입 
    @Override
    public void insertUser(MemberDTO user) {
        String sql = "INSERT INTO member (id, password, name, address, phone, email) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, user.getId());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getName());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getPhone());
            pstmt.setString(6, user.getEmail());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("회원 등록 실패", e);
        }
    }

    
    //로그인 
    @Override
    public MemberDTO getUserByUsernameAndPassword(String id, String password) {
        String sql = "SELECT * FROM member WHERE id = ? AND password = ?";
        MemberDTO user = null;

        try (Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    user = new MemberDTO();
                    user.setId(rs.getString("id"));
                    user.setPassword(rs.getString("password"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("로그인 처리 실패", e);
        }

        return user;
    }

    
    // 관리자 로그인 db 저장
    @Override
    public MemberDTO getAdminByUsernameAndPassword(String id, String password) {
        String sql = "SELECT * FROM admin WHERE id = ? AND password = ?";
        MemberDTO admin = null;

        try (Connection conn = DriverManager.getConnection(URL, DB_USER, DB_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    admin = new MemberDTO();
                     admin.setId(rs.getString("id"));
                    admin.setPassword(rs.getString("password"));
                    // 필요시 추가 정보 set
                } //안녕//
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("관리자 로그인 처리 실패", e);
        }

        return admin;
    }


}
