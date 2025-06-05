package org.zerock.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//역할: 웹 요청을 받아 로그인 처리(id,passwod), 세션 생성 등 웹 로직 수행.
// DAOImpl에 있는 기반으로 작용
@WebServlet("/user")
public class UserService extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final String URL = "jdbc:mysql://192.168.30.232:3306/your_database?useSSL=false&serverTimezone=UTC";
	private static final String DB_id = "your_user";
    private static final String DB_password = "your_password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver 로드 실패", e);
        }

        
       //my sql이랑 연동해서 id,pw 찾기 
        String sql = "SELECT 1 FROM member WHERE id = ? AND password = ?";

        try (
            Connection conn = DriverManager.getConnection(URL, DB_id, DB_password);
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ) {
            pstmt.setString(1, id);
            pstmt.setString(2, password);

            //로그인 성공 시 메인 LiveAirMain으로 넘어가게끔 해주기 
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    request.getSession().setAttribute("user", id);
                    response.sendRedirect("LiveAirMain.jsp");
                    return;
                }
            } 

        } catch (SQLException e) {
            throw new ServletException("DB 오류 발생", e);
        }
//안녕// 
        // 로그인 실패 시
        response.sendRedirect("login.jsp?error=true");
    }
}


