package org.zerock.service;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// 안녕
@WebServlet("/logout")
public class LogoutService extends HttpServlet{
// 로그아웃 버튼을 누를시 메인페이지로 바뀌는되는 서블릿 	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.getSession().invalidate();
		
		response.sendRedirect(request.getContextPath() + "/LiveAirMain.jsp");
	}

}
