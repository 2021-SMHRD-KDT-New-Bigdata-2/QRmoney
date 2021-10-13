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
		
		// �α��� ���� ��������
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
//		vo.get
		
		System.out.println(sender_id);
		System.out.println(receiver_id);
		System.out.println(message);
		
		MessageVO vo1 = new MessageVO(sender_id, receiver_id, message);
		MessageDAO dao = new MessageDAO();
		
		// �޼��� ����
		int cnt = dao.insertMessage(vo1);
		
		if(cnt>0) {
			System.out.println("�޽��� ���� ����");
		}else {
			System.out.println("�޽��� ���� ����");
		}
		
//		// ������ �� �޼��� Ȯ���ϱ� 
//		ArrayList<MessageVO> massageList = dao.showMessage(email);
//		
//		// �޼��� ��ü ����
//		cnt = dao.deleteAll(email);
//		// �޼��� ���� ����
//		cnt = dao.deleteOne(email);
	}

}
