package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FollowDAO2;
import com.model.MemberVO;
@WebServlet("/UnfollowService")
public class UnfollowService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		// 로그인 정보
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String nickName = request.getParameter("nickName");
		
		FollowDAO2 dao = new FollowDAO2();
		
		int cnt = dao.followcancel(vo.getMember_id(), nickName);
		
		if(cnt>0) {
			response.sendRedirect(request.getHeader("Referer"));
		}
				
	}

}
