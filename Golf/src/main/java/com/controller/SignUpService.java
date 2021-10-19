package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/SignUpService")
public class SignUpService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");	
		
		@SuppressWarnings("deprecation")
		String profile_folder = request.getRealPath("assets/profile_pic");
		
		MultipartRequest multi = new MultipartRequest(request, profile_folder, 10*300*600, "euc-kr", new DefaultFileRenamePolicy());
		
		String email = multi.getParameter("emailFront")+multi.getParameter("emailBack");
		String password = multi.getParameter("password");
		String nickname = multi.getParameter("nickname");
		String profilePic = multi.getFilesystemName("photoBtn");
		
		if(profilePic != null){
			File oldFile = new File(profile_folder+"/"+profilePic);
			File newFile = new File(profile_folder+"/"+email+".jpg");
			oldFile.renameTo(newFile);
			profilePic = email+".jpg";
		} else {
			profilePic = "default.jpg";
		}
		
		String gender = multi.getParameter("gender");
		String contact = multi.getParameter("contact");
		String age = multi.getParameter("age");
		String gameType = multi.getParameter("gameType");
		String Field_Scoree = multi.getParameter("fieldScore");
		String Screen_Score = multi.getParameter("screenScore");
		String address = multi.getParameter("address");
		
		System.out.println(email+"/"+password+"/"+nickname+"/"+profilePic+"/"+gender+"/"+contact+"/"+age+"/"+gameType+"/"+Field_Scoree+"/"+Screen_Score+"/"+address);
		MemberVO vo = new MemberVO(email, password, nickname, gender, contact, age, gameType, Screen_Score, Field_Scoree, address, profilePic);
		MemberDAO dao = new MemberDAO();
		int result = dao.SignUp(vo);
		if(result>0) {
			System.out.println("입력성공");
			response.sendRedirect("main.jsp");
		}else {
			System.err.println("입력실패");
			response.sendRedirect("main.jsp");
		}
		
	}

}
