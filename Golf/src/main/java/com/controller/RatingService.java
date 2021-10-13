package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberVO;


@WebServlet("/RatingService")
public class RatingService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String email = "gudan@gmail.com";
		String String_rating =request.getParameter("rating");
		int rating = Integer.parseInt(String_rating);
		MemberVO vo1= new MemberVO(email, rating);
		
		MemberDAO dao =new MemberDAO();
		int result = dao.RatingEstimation(vo1);
		if (result>0) {
			System.out.println("레이팅 시스템 성공 "+rating);
			
			
		} else {
			System.out.println("레이팅 시스템 실패");
		}
	
	}

}
