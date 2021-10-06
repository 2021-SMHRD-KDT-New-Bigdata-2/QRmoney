package com.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/SignUpService")
public class SignUpService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");	
		
		@SuppressWarnings("deprecation")
		String profile_folder = request.getRealPath("assets/profile_pic");
		
		MultipartRequest multi = new MultipartRequest(request, profile_folder, 10*500*500, "euc-kr", new DefaultFileRenamePolicy());
		
		String email = multi.getParameter("emailFront")+multi.getParameter("emailBack");
		String password = multi.getParameter("password");
		String nickname = multi.getParameter("nickname");
		String profilePic = multi.getFilesystemName("profilePic");
		
		if(profilePic != null){
			File oldFile = new File(profile_folder+"/"+profilePic);
			File newFile = new File(profile_folder+"/"+email+".jpg");
			oldFile.renameTo(newFile);
			profilePic = "email.jpg";
		} else {
			profilePic = "default.jpg";
		}
		
		String gender = multi.getParameter("gender");
		String contact = multi.getParameter("contact");
		String age = multi.getParameter("age");
		String gameType = multi.getParameter("gameType");
		String fieldScore = multi.getParameter("fieldScore");
		String screenScore = multi.getParameter("screenScore");
		String address = multi.getParameter("address");
		
		System.out.println(email+"/"+password+"/"+nickname+"/"+profilePic+"/"+gender+"/"+contact+"/"+age+"/"+gameType+"/"+fieldScore+"/"+screenScore+"/"+address);
	}

}
