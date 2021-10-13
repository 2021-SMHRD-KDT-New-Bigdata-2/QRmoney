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
	
		int sender_id = Integer.parseInt(request.getParameter("sender_id"));
		int receiver_id  = Integer.parseInt(request.getParameter("receiver_id"));
		String message = request.getParameter("message");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
//		vo.get
		
		System.out.println(sender_id);
		System.out.println(receiver_id);
		System.out.println(message);
		
		MessageVO vo1 = new MessageVO(sender_id, receiver_id, message);
		MessageDAO dao = new MessageDAO();
		
		// 메세지 전송
		int cnt = dao.insertMessage(vo1);
		
		if(cnt>0) {
			System.out.println("메시지 전송 성공");
		}else {
			System.out.println("메시지 전송 실패");
		}
		
//		// 나에게 온 메세지 확인하기 
//		ArrayList<MessageVO> massageList = dao.showMessage(email);
//		
//		// 메세지 전체 삭제
//		cnt = dao.deleteAll(email);
//		// 메세지 선택 삭제
//		cnt = dao.deleteOne(email);
	}

}
