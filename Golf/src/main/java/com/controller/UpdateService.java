package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/UpdateService")
public class UpdateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setCharacterEncoding("euc-kr");
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String email = vo.getEmail();
		
		@SuppressWarnings("deprecation")
		String profile_folder = request.getRealPath("assets/profile_pic");
		
		MultipartRequest multi = new MultipartRequest(request, profile_folder, 10*300*600, "euc-kr", new DefaultFileRenamePolicy());
		String password = multi.getParameter("password");  
		String profile_pic = multi.getFilesystemName("photoBtn"); 
		String gender = multi.getParameter("gender"); 
		String contact = multi.getParameter("contact"); 
		String game_type = multi.getParameter("gameType"); 
		String score_field = multi.getParameter("fieldScore");
		String score_screen = multi.getParameter("screenScore"); 
		
		if(profile_pic != null){
			File oldFile = new File(profile_folder+"/"+profile_pic);
			File newFile = new File(profile_folder+"/"+email+".jpg");
			oldFile.renameTo(newFile);
			profile_pic = "email.jpg";
		} else {
			profile_pic = "default.jpg";
		}
		
		System.out.println(password+"/"+profile_pic+"/"+gender+"/"+contact+"/"+game_type+"/"+score_field+"/"+score_screen);
		
		MemberVO vo1 = new MemberVO(email, password, gender, contact, game_type, score_screen, score_field, profile_pic);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(vo1);
		
		PrintWriter out = response.getWriter();
		
		if(cnt>0) {
			System.out.println("수정 성공");
	        out.print("<script>"
	               +"alert('회원정보가 수정되었습니다.');"
	               +"location.href = 'main.jsp';"
	               +"</script>");
	        
	        // 세션 수정 
	        String member_id = vo.getMember_id(); 
	        String nickname = vo.getNickname(); 
	        String age = vo.getAge(); 
	        String address = vo.getAddress(); 
	        String ratings_total = vo.getRatings_total(); 
	        String ratings_cnt = vo.getRatings_cnt(); 
	        
	        MemberVO vo2 = new MemberVO(member_id, email, nickname, gender, contact, age, game_type, score_screen, score_field, address, profile_pic, ratings_total, ratings_cnt);
	        session.setAttribute("member", vo2);
	        
	        System.out.println(member_id+" "+gender+" "+score_screen+" "+age);
	        
		}else {
			System.out.println("수정 실패 ");
			out.print("<script>"
		               +"alert('회원정보 수정에 실패했습니다.');"
		               +"location.href = 'main.jsp';"
		               +"</script>");
		}
		
	}
		
	

}
