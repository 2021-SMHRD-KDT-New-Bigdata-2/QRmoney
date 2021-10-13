package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.GameDAO;
import com.model.GameVO;

@WebServlet("/SearchGameService")
public class SearchGameService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String type = request.getParameter("game_type");
		String sido = request.getParameter("sido1").replace("시", " ");
		if(sido.equals("전국 전체")) {
			sido = "";
		}
		String gugun = request.getParameter("gugun1");
		if(gugun.equals("전체")) {
			gugun = "";
		}
		String address = sido+gugun;
		String score = request.getParameter("score");
		
		System.out.println("검색 조건 : "+type+"/"+address+"/"+score);
		
		GameDAO dao = new GameDAO();
		ArrayList<GameVO> gameList = dao.searchGameList(type, address);
		
		HttpSession session = request.getSession();
		session.setAttribute("searchResult", gameList);
		response.sendRedirect("searchresult.jsp");
		
	}

}
