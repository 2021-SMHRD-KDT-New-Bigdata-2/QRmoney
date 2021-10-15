package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.GroupDAO;
import com.model.MemberVO;

@WebServlet("/JoinGroupService")
public class JoinGroupService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		
		String game_id = request.getParameter("id");
		String member_id = vo.getMember_id();
		
		GroupDAO dao = new GroupDAO();
		dao.joinGroup(Integer.parseInt(game_id), Integer.parseInt(member_id));
		PrintWriter out = response.getWriter();
		out.print("<script>alert('참가완료')</script>");
		response.sendRedirect("searchresult.jsp");
		
	}

}
