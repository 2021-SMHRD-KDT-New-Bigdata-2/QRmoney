package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FollowDAO2;
import com.model.MemberVO;

/**
 * Servlet implementation class followService2
 */
@WebServlet("/followService2")
public class followService2 extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �ȷο� ���� 
				request.setCharacterEncoding("euc-kr");
				
				// �α��� ����
				HttpSession session = request.getSession();
				MemberVO vo = (MemberVO)session.getAttribute("member");
				
				String nickName = request.getParameter("nickName"); // �ȷο� �� ���
				
				FollowDAO2 dao = new FollowDAO2();
				
				response.setCharacterEncoding("euc-kr");
				response.setContentType("text/html; charset=euc-kr");
				PrintWriter out = response.getWriter();
				
				String ref = request.getHeader("Referer");
				
				int cnt = dao.follow(vo.getMember_id(), nickName);
				
				if(cnt>0) {
					out.print("<script>"
							+"alert('11arddddd �Ͼƾƾƾ�.');"
							+"location.href = '"+ref+"';"
							+"</script>");
//					response.sendRedirect(request.getHeader("Referer"));
				}
	}

}
