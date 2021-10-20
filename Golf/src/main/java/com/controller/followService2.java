package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FollowDAO;
import com.model.FollowDAO2;
import com.model.FollowVO;
import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/followService2")
public class followService2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 팔로우 서비스 
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		// 로그인 정보
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String nickName = request.getParameter("nickName"); // 팔로우 할 사람
		
		FollowDAO2 dao = new FollowDAO2();
		
		PrintWriter out = response.getWriter();
		
		int cnt = dao.follow(vo.getMember_id(), nickName);
		
		String ref =request.getHeader("Referer");
		if(cnt>0) {
			out.print("<script>"
					+"alert('팔로우 성공!!');"
					+"location.href = '"+ref+"';"
					+"</script>");
			
		}else {
			out.print("<script>"
					+"alert('언팔로우 성공!!');"
					+"location.href = '"+ref+"';"
					+"</script>");
			
		}
			
	}

}
