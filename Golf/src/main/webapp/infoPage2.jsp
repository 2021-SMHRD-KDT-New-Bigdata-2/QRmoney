<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberVO"%>
<%@page import="com.model.FollowDAO2"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MessageVO"%>
<%@page import="com.model.FollowDAO"%>
<%@page import="com.model.FollowVO"%>
<%@page import="com.model.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>  
	<%  
	
		// 회원 정보
		String nickName = request.getParameter("nickName");
		
		MemberDAO memberDAO = new MemberDAO();
		MemberVO profile = memberDAO.getInfo(nickName);
		
		// 평점 확인
		double avg1 = 0;
		if(profile.getRatings_total().equals("0")){
			avg1 = 0;
		}else{
			double total = Integer.parseInt(profile.getRatings_total());
			double cnt = Integer.parseInt(profile.getRatings_cnt());
			
			double avg = total/cnt;
			avg1 = (double)Math.round(avg*100/10);
		}
				
		// 로그인 세션 
		MemberVO member = (MemberVO)session.getAttribute("member");	
		
		// 팔로우/언팔로우 확인
		FollowDAO2 followdao = new FollowDAO2();
		boolean chk = followdao.followCheck(Integer.parseInt(member.getMember_id()), nickName);
		
		// 나를 팔로우 한 사람 => 팔로워
		ArrayList<String> follower = followdao.followList(member.getMember_id());
		
		// 팔로잉
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
					        <span class="location-title"> 평점 : <%=avg1/10%></span><span></span><br> 
							<span class="location-title"> 팔로워 : <%=follower.size()%></span><span></span><br>
							<span class="location-title"> 팔로잉 : <%=following.size()%></span><span></span><br>					                
					      </div>
					    </div>
					</div>
                </div>
                <div class="col-md-8">
                	<table class="table mt-5 mb-2 table-hover" >
	                <tbody class="profile-table">
	                    <tr>
		                    <th scope="row" class="col-md-4">닉네임</th>
		                    <td><%=profile.getNickname()  %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">나이</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("설정 없음");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">성별</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("설정 없음");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">선호 게임타입</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("설정 없음");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">스크린 스코어</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("설정 없음");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                    <tr>
		                    <th scope="row">필드 스코어</th>
		                    <td>
		                    	<%
		                    		if(profile.getAge() == null){
		                    			out.print("설정 없음");
		                    		}else{
		                    			out.print(profile.getAge());
		                    		}
		                    	%>
		                    </td>
	                    </tr>
	                </tbody>
                </table>
                <div class="my-4">
	                <a class="btn btn-primary" data-bs-toggle="modal" href="#sendMsg">메세지보내기</a>
	                <% if(chk) { %>
	                	<a class="btn btn-primary" href="UnfollowService?nickName=<%=profile.getNickname()%>">언팔로우</a>
	                <% } else { %>
	                	<a class="btn btn-primary" href="followService2?nickName=<%=profile.getNickname()%>">팔로우</a>
	                <% } %>
	            </div>
                </div>
                <div class="modal fade" id="sendMsg" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			        <div class="modal-dialog">
				        <form action="MessageService" id="messageForm">
				            <div class="modal-content">
				                <div class="modal-header bg-light">
				                <h5 class="modal-title" id="exampleModalLabel" >메시지 보내기</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
			                        <div>
			                            <input name="receiver_id" id="receiver_id" type="text" class="form-control" placeholder="받는 사람을 입력하세요">       
			                        </div>
			                        <br>
			                        <div>
			                            <div >
			                                <textarea name="message" id="message" class="form-control" cols="53" rows="5" placeholder="메시지를 입력하세요"></textarea>
			                            </div> 
			                        </div>
				                </div>
				                <div class="modal-footer bg-light">
					                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
					                <button type="submit" class="btn btn-outline-primary">보내기</button>
				                </div>
				            </div>
				        </form>
			        </div>
		    	</div>
            </div>
        </div>
    </section>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>