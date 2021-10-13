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
		int receiverId  = Integer.parseInt(request.getParameter("receiver_id"));
		String message = request.getParameter("message");
		
		System.out.println(senderId);
		System.out.println(receiverId);
		System.out.println(message);
		
		MessageVO vo1 = new MessageVO(senderId, receiverId, message);
		MessageDAO dao = new MessageDAO();
		
		// 메세지 전송
		int cnt = dao.insertMessage(vo1);
		
		if(cnt>0) {
			System.out.println("메시지 전송 성공");
		}else {
			System.out.println("메시지 전송 실패");
		}
		
		// 나에게 온 메세지 확인하기 
		ArrayList<MessageVO> massageList = dao.showMessage(receiverId);
		
		// 메세지 전체 삭제
		cnt = dao.deleteAll(senderId);
		
		// 메세지 선택 삭제 - 페이지에서 num값을 받아와야 합니다
//		cnt = dao.deleteOne(num);
	}

}
