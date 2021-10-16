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
		response.setCharacterEncoding("euc-kr");
		
		request.setCharacterEncoding("euc-kr");		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String game_id = request.getParameter("id");
		String member_id = vo.getMember_id();
		
		String page = request.getHeader("Referer");
		
		GroupDAO dao = new GroupDAO();
		int result = dao.joinGroup(Integer.parseInt(game_id), Integer.parseInt(member_id));
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			out.print("<script>"
					+"alert('그룹에 참가했습니다.');"
					+"location.href ='"+page+"';"
					+"</script>");
		} else {
			out.print("<script>"
					+"alert('그룹 참가에 문제가 발생했습니다.\n다시 시도해주세요.');"
					+"location.href ='"+page+"';"
					+"</script>");
		}
		
	}

}
