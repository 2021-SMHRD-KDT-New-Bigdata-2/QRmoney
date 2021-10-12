package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FieldDAO;
import com.model.GameDAO;
import com.model.GroupDAO;
import com.model.MemberDAO;
import com.model.MemberVO;

@WebServlet("/MakeGameField")
public class MakeGameField extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		FieldDAO fieldDAO = new FieldDAO();
		
		String game_name = request.getParameter("game-name");
		String game_type = "field";
		String field_name = request.getParameter("location");
		int location = fieldDAO.getFieldIDbyName(field_name);
		String date = request.getParameter("game-date");
		String game_date = date.replace("T", " ");
		int game_fee = Integer.parseInt(request.getParameter("game-fee"));
		String game_length = request.getParameter("game-length");
		int total_member = Integer.parseInt(request.getParameter("total-member"));
		
		System.out.println(game_name+"/"+game_type+"/"+location+"/"+game_date+"/"+game_fee+"/"+game_length+"/"+total_member);
		
		GameDAO gameDAO = new GameDAO();
		int result = gameDAO.makeGame(game_name, game_type, location, game_date, game_fee, game_length, total_member);
		
		PrintWriter out = response.getWriter();
		
		if(result>0) {
			int game_id = gameDAO.getGameIDbyName(game_name);
			
			GroupDAO groupDAO = new GroupDAO();
			MemberDAO memberDAO = new MemberDAO();
			groupDAO.joinGroup(game_id, memberDAO.getMemberIdbyEmail(member.getEmail()));
			out.print("<script>"
					+"alert('그룹이 등록되었습니다.');"
					+"location.href = 'main.jsp';"
					+"</script>");
		} else {
			out.print("<script>"
					+"alert('그룹 등록에 실패했습니다.');"
					+"location.href = 'main.jsp';"
					+"</script>");
		}
	}

}
