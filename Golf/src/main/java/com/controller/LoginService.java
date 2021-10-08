package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String Email = request.getParameter("email");
		String pw = request.getParameter("password"); 
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.Login(Email, pw);
		HttpSession session = request.getSession();
		session.setAttribute("member", vo);
		response.sendRedirect("main.jsp");
		
	}

}
