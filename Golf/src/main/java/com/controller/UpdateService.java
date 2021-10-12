package com.controller;

import java.io.File;
import java.io.IOException;
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
		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		String email = vo.getEmail();	
		
		@SuppressWarnings("deprecation")
		String profile_folder = request.getRealPath("assets/profile_pic");
		
		MultipartRequest multi = new MultipartRequest(request, profile_folder, 10*300*600, "euc-kr", new DefaultFileRenamePolicy());
		String password = multi.getParameter("password");  
		String profilePic = multi.getFilesystemName("profilePic"); 
		String gender = multi.getParameter("gender"); 
		String contact = multi.getParameter("contact"); 
		String gameType = multi.getParameter("gameType"); 
		String fieldScore = multi.getParameter("fieldScore"); 
		String screenScore = multi.getParameter("screenScore"); 
		
		if(profilePic != null){
			File oldFile = new File(profile_folder+"/"+profilePic);
			File newFile = new File(profile_folder+"/"+email+".jpg");
			oldFile.renameTo(newFile);
			profilePic = "email.jpg";
		} else {
			profilePic = "default.jpg";
		}
		
		System.out.println(password+"/"+profilePic+"/"+gender+"/"+contact+"/"+gameType+"/"+fieldScore+"/"+screenScore);
		
		MemberVO vo1 = new MemberVO(email, password, gender, contact, gameType, screenScore, fieldScore, profilePic);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.update(vo1);
		
		if(cnt>0) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패 ");
		}
		
	}
		
	

}
