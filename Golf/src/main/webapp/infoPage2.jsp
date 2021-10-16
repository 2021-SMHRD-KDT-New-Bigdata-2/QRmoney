<%@page import="com.model.FollowDAO2"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MessageVO"%>
<%@page import="com.model.FollowDAO"%>
<%@page import="com.model.FollowVO"%>
<%@page import="com.model.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<%@ include file= "navbar_member.jsp" %>
<body>  
	<%  
	
		// ȸ�� ����
		String nickName = request.getParameter("nickName");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberVO profile = memberDAO.getInfo(nickName);
		
		// ���� Ȯ��
		double avg1 = 0;
		if(profile.getRatings_total().equals("0")){
			avg1 = 0;
		}else{
			double total = Integer.parseInt(profile.getRatings_total());
			double cnt = Integer.parseInt(profile.getRatings_cnt());
			
			double avg = total/cnt;
			avg1 = (double)Math.round(avg*100/10);
		}
				
		// �α��� ���� 
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		// �ȷο�/���ȷο� Ȯ��
		FollowDAO2 followdao = new FollowDAO2();
		boolean chk = followdao.followCheck(Integer.parseInt(member.getMember_id()), nickName);
		
		// ���� �ȷο� �� ��� => �ȷο�
		ArrayList<String> follower = followdao.followList(member.getMember_id());
		
		// �ȷ���
		ArrayList<String> following = followdao.followingList(member.getMember_id());
		
		
	%>
	<!-- My page-->
    <section class="bg-section" id="mypage">
        <div class="container-sm search-result mx-auto">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-wrapper my-5 mx-auto">      
						<div class="profile">
					      <div class="profile-image">
					        <img src="assets/profile_pic/<%= profile.getProfilePic() %>" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p><%=profile.getNickname() %></p>					        
					        <span class="location-title"> ���� : <%=avg1/10%></span><span></span><br> 
							<span class="location-title"> �ȷο� : <%=follower.size()%></span><span></span><br>
							<span class="location-title"> �ȷ��� : <%=following.size()%></span><span></span><br>					                
					      </div>
					    </div>
					</div>
                </div>
                <div class="col-md-8">
                	<table class="table my-5 table-hover" >
	                <tbody>
	                    <tr>
		                    <th scope="row" >�г���</th>
		                    <td><%=profile.getNickname()  %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">����</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("���� ����");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">����</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("���� ����");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">��ȣ ����Ÿ��</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("���� ����");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">��ũ�� ���ھ�</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("���� ����");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">�ʵ� ���ھ�</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("���� ����");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                </tbody>
                </table>
                <button class="btn btn-primary">�޼��� ������</button>
                <% if(chk) { %>
                	<a class="btn btn-primary" href="UnfollowService?nickName=<%=profile.getNickname()%>">���ȷο�</a>
                <% } else { %>
                	<a class="btn btn-primary" href="followService2?nickName=<%=profile.getNickname()%>">�ȷο�</a>
                <% } %>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="footer.html" %>
</body>
</html>