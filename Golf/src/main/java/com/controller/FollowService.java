package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FollowDAO;
import com.model.FollowVO;
import com.model.MemberVO;



@WebServlet("/FollowService")
public class FollowService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		// ��ư�� ������ ���� ���̵� �����ͼ� 
		String FollowStart = request.getParameter("Startfollow");
		String FollowCancel = request.getParameter("cancelfollow");
		
		//�ȷο� ���
		FollowDAO dao = new FollowDAO();
		String Follower=dao.FollowEmailConfirm(FollowStart);
		if(Follower == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+"alert('�̸��� ����� �����ּ���.');"
					+"location.href = 'FollowTEST.jsp';"
					+"</script>");
			
		} else {
			FollowVO fvo= new FollowVO(Follower, vo.getMember_id());
			int result =dao.FollowHaJa(fvo);
			if(result>0) {
				System.out.println("������ �ȷο찡 ����Ǿ����ϴ�.");
				response.sendRedirect("mypage.jsp");
			}else {
				System.out.println("�ȷο찡 ������� �ʾѽ��ϴ�.");
				response.sendRedirect("FollowTEST.jsp");
			}
			
			
		}
		
		
		//���ȷο� ���
		Follower=dao.FollowEmailConfirm(FollowCancel);
		if(Follower == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+"alert('�̸��� ����� �����ּ���.');"
					+"location.href = 'FollowTEST.jsp';"
					+"</script>");
			
		} else {
			FollowVO fvo= new FollowVO(Follower, vo.getMember_id());
			int result =dao.FollowAnHe(fvo);
			if(result>0) {
				System.out.println("������ ���ȷο찡 ����Ǿ����ϴ�.");
				response.sendRedirect("mypage.jsp");
			}else {
				System.out.println("���ȷο찡 ������� �ʾѽ��ϴ�.");
				response.sendRedirect("FollowTEST.jsp");
			}
			
		}
		
		//�ȷο� �����ֱ�
		
	}

}
