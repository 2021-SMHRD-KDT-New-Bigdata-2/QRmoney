package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MessageDAO;


@WebServlet("/MessageDeleteOne")
public class MessageDeleteOne extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num = request.getParameter("num");
		MessageDAO dao = new MessageDAO();
		
		int result = dao.deleteOne(num);
		if(result>0) {
			System.out.println("삭제성공");
			
		}else {
			System.out.println("삭제실패");
		}
		response.sendRedirect("mypage.jsp");
	}

}
