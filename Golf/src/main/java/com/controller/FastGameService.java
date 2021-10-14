package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.FastGameMatchingDAO;
import com.model.GameDAO;


@WebServlet("/FastGameService")
public class FastGameService extends HttpServlet {
	


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Latiude = request.getParameter("Latiude");
		String Longitude = request.getParameter("longitude");
		
		FastGameMatchingDAO dao = new FastGameMatchingDAO();
		dao.FastGameMatching5KM(Latiude, Longitude);
		
	}

}
