package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		System.out.println(sender_id);
		System.out.println(receiver_id);
		System.out.println(message);
		
		MessageVO vo = new MessageVO(sender_id, receiver_id, message);
		MessageDAO dao = new MessageDAO();
		
		// �޼��� ����
		int cnt = dao.insertMessage(vo);
		
		if(cnt>0) {
			System.out.println("�޽��� ���� ����");
		}else {
			System.out.println("�޽��� ���� ����");
		}
		
		// ������ �� �޼��� Ȯ���ϱ� 
		
	}

}
