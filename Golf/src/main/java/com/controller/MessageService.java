package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberVO;
import com.model.MessageDAO;
import com.model.MessageVO;

@WebServlet("/MessageService")
public class MessageService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
	
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		int senderId = Integer.parseInt(vo.getMember_id()); 
		String receiverNick  = request.getParameter("receiver"); 
		String message = request.getParameter("message");
		
		System.out.println(senderId);
		System.out.println(receiverNick);
		System.out.println(message);
		
		// 메세지 전송 
		MessageVO vo1 = new MessageVO(senderId, receiverNick, message);
		MessageDAO dao = new MessageDAO();
		
		int cnt = dao.insertMessage(receiverNick, vo1);
		
		if(cnt>0) {
			System.out.println("메시지 전송 성공");
			response.sendRedirect(request.getHeader("Referer"));
		}else {
			System.out.println("메시지 전송 실패");
			response.sendRedirect(request.getHeader("Referer"));
		}
		
	}

}
