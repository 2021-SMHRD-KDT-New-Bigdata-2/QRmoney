package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FastGameMatchingDAO;
import com.model.GameDAO;
import com.model.GroupDAO;
import com.model.MemberVO;


@WebServlet("/FastGameService")
public class FastGameService extends HttpServlet {
	


	@SuppressWarnings("unused")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");		
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		
		response.setCharacterEncoding("UTF-8"); response.
		setContentType("text/html; charset=UTF-8");
				
		PrintWriter out = response.getWriter();
		
		int SrccenScore = Integer.parseInt(vo.getscore_screen());
		int member_id = Integer.parseInt(vo.getMember_id());
		
		
		String Latiude = request.getParameter("Latiude");
		String Longitude = request.getParameter("longitude");
		
		GroupDAO gdao = new GroupDAO();
		FastGameMatchingDAO dao = new FastGameMatchingDAO();
		ArrayList<Integer> FastGameList = dao.FastGameMatching5KM(Latiude, Longitude, member_id);
		System.out.println("���Ӹ���Ʈ������ :"+FastGameList.size());
		int cnt1= 0;
		if(FastGameList!=null) {
			while(true) {
				int game_id=FastGameList.get(cnt1);
				System.out.println("���Ӿ��̵� : "+game_id);
				int GameAvg=gdao.GameGroupsAvg(game_id);
				System.out.println("������� : "+GameAvg);
				if(SrccenScore-10<GameAvg && GameAvg<SrccenScore+10) {
					int cnt =gdao.joinGroup(game_id,member_id);
					if(cnt>0) {
						out.print("<script>"
								+"alert('���Ӹ�Ī����.');"
								+"location.href = 'main.jsp';"
								+"</script>");
						System.out.println("���Ӹ�Ī����");
						break;
					}else {
						out.print("<script>"
								+"alert('�����̾ȵ�..');"
								+"location.href = 'main.jsp';"
								+"</script>");
						System.out.println("������������");
						break;
					}						
				 }
				cnt1++;
			 	}
			}else {
				ArrayList<Integer> FastGameList10KM = dao.FastGameMatching10KM(Latiude, Longitude, member_id);
				cnt1=0;
				while(true) {
					int game_id=FastGameList10KM.get(cnt1);
					System.out.println("���Ӿ��̵� : "+game_id);
					int GameAvg=gdao.GameGroupsAvg(game_id);
					System.out.println("������� : "+GameAvg);
					if(SrccenScore-10<GameAvg && GameAvg<SrccenScore+10) {
						int cnt =gdao.joinGroup(game_id,member_id);
						if(cnt>0) {
							out.print("<script>"
									+"alert('���Ӹ�Ī����.');"
									+"location.href = 'main.jsp';"
									+"</script>");
							System.out.println("���Ӹ�Ī����");
							break;
						}else {
							out.print("<script>"
									+"alert('�����̾ȵ�..');"
									+"location.href = 'main.jsp';"
									+"</script>");
							System.out.println("������������");
							break;
						}						
					 }
					cnt1++;
				 	}
			}
		
//		
//		out.print("<script>"
//				+"alert('���������� �Ҽ��ִ� ���� �����ϴ�..');"
//				+"location.href = 'main.jsp';"
//				+"</script>");
//		response.sendRedirect("main.jsp");
	}
	
}
