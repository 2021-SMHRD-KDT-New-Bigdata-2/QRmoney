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
		
		// 버튼을 누르면 상대방 아이디를 가져와서 
		String FollowStart = request.getParameter("Startfollow");
		String FollowCancel = request.getParameter("cancelfollow");
		
		//팔로우 기능
		FollowDAO dao = new FollowDAO();
		String Follower=dao.FollowEmailConfirm(FollowStart);
		if(Follower == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+"alert('이메일 제대로 적어주세요.');"
					+"location.href = 'FollowTEST.jsp';"
					+"</script>");
			
		} else {
			FollowVO fvo= new FollowVO(Follower, vo.getMember_id());
			int result =dao.FollowHaJa(fvo);
			if(result>0) {
				System.out.println("정상적 팔로우가 실행되엇습니다.");
				response.sendRedirect("mypage.jsp");
			}else {
				System.out.println("팔로우가 실행되지 않앗습니다.");
				response.sendRedirect("FollowTEST.jsp");
			}
			
			
		}
		
		
		//언팔로우 기능
		Follower=dao.FollowEmailConfirm(FollowCancel);
		if(Follower == null) {
			PrintWriter out = response.getWriter();
			out.print("<script>"
					+"alert('이메일 제대로 적어주세요.');"
					+"location.href = 'FollowTEST.jsp';"
					+"</script>");
			
		} else {
			FollowVO fvo= new FollowVO(Follower, vo.getMember_id());
			int result =dao.FollowAnHe(fvo);
			if(result>0) {
				System.out.println("정상적 언팔로우가 실행되엇습니다.");
				response.sendRedirect("mypage.jsp");
			}else {
				System.out.println("언팔로우가 실행되지 않앗습니다.");
				response.sendRedirect("FollowTEST.jsp");
			}
			
		}
		
		//팔로우 보여주기
		
	}

}
