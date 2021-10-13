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
		
		// �޼��� ����
		int cnt = dao.insertMessage(vo1);
		
		if(cnt>0) {
			System.out.println("�޽��� ���� ����");
		}else {
			System.out.println("�޽��� ���� ����");
		}
		
		// ������ �� �޼��� Ȯ���ϱ� 
		ArrayList<MessageVO> massageList = dao.showMessage(receiverId);
		
		// �޼��� ��ü ����
		cnt = dao.deleteAll(senderId);
		
		// �޼��� ���� ���� - ���������� num���� �޾ƿ;� �մϴ�
//		cnt = dao.deleteOne(num);
	}

}
