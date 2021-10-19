package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberVO;
import com.model.MessageDAO;

/**
 * Servlet implementation class MessageDelete
 */
@WebServlet("/MessageDeleteAll")
public class MessageDeleteAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("euc-kr");		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		int Recive_id = Integer.parseInt(vo.getMember_id());
		MessageDAO dao = new MessageDAO();
		
		System.out.println(Recive_id);
		int result = dao.deleteAll(Recive_id);
		if(result>0) {
			System.out.println("삭제성공");
			
		}else {
			System.out.println("삭제실패");
		}
		response.sendRedirect("mypage.jsp");
	}

}
