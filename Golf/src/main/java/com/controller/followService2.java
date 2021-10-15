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
		
		int cnt = 0;
		
		// �α��� ����
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String nickName = request.getParameter("nickName"); // �ȷο� �� ���
		
		FollowDAO2 dao = new FollowDAO2();
		
		// followhaja
		cnt = dao.follow(vo.getMember_id(), nickName);
		
		// followcancel
		cnt = dao.followcancel(vo.getMember_id(), nickName);
		
		// followList = ���� �ȷο��� ��� ���
		
		// followingList = ���� �ȷο��� ���
		
		// -------------- ������ -------------
		
//		// ��ư�� ������ ���� ���̵� �����ͼ� 
//		String FollowStart = request.getParameter("Startfollow");
//		String FollowCancel = request.getParameter("cancelfollow");
//		
//		//�ȷο� ���
//		FollowDAO dao = new FollowDAO();
//		String Follower=dao.FollowEmailConfirm(FollowStart);
//		if(Follower == null) {
//			PrintWriter out = response.getWriter();
//			out.print("<script>"
//					+"alert('�̸��� ����� �����ּ���.');"
//					+"location.href = 'FollowTEST.jsp';"
//					+"</script>");
//			
//		} else {
//			FollowVO fvo= new FollowVO(Follower, vo.getMember_id());
//			int result =dao.FollowHaJa(fvo);
//			if(result>0) {
//				System.out.println("������ �ȷο찡 ����Ǿ����ϴ�.");
//				response.sendRedirect("mypage.jsp");
//			}else {
//				System.out.println("�ȷο찡 ������� �ʾѽ��ϴ�.");
//				response.sendRedirect("FollowTEST.jsp");
//			}
//			
//			
//		}
		
		
		
	}

}
