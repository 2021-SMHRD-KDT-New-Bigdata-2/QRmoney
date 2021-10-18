<%@page import="com.model.GroupDAO"%>
<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.GameVO"%>
<%@page import="com.model.FollowDAO2"%>
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

		// 로그인 세션
		MemberVO member = (MemberVO)session.getAttribute("member");
	
		// 평점 확인 
		double avg1 = 0;
		if(member.getRatings_total().equals("0")){
			avg1 = 0;
		}else{
			double total= Integer.parseInt(member.getRatings_total());
			double cnt = Integer.parseInt(member.getRatings_cnt());
			double avg = total/cnt;
			avg1 = (double)Math.round(avg*100/10);
		}
		
		// 받은 메세지 보여주기
		MessageDAO message = new MessageDAO(); 
		ArrayList<MessageVO> messageList = new ArrayList<MessageVO>();
		messageList = message.showMessage((Integer.parseInt(member.getMember_id())));
		
		
		// 팔로우, 팔로워 리스트 보여주기
		FollowDAO2 follow = new FollowDAO2();
		ArrayList<String> followList = follow.followList(member.getMember_id());
		ArrayList<String> followingList = follow.followingList(member.getMember_id());
		
		// 게임 기록 출력용 DAO
		MemberDAO memberDAO = new MemberDAO();
		GroupDAO groupDAO = new GroupDAO();
	%>
	<!-- My page-->
    <section class="bg-section" id="mypage">
        <div class="container-sm search-result mx-auto">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-wrapper my-5 mx-auto">      
						<div class="profile">
					      <div class="profile-image">
					        <img src="assets/profile_pic/<%= member.getProfilePic() %>" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p><%=member.getNickname() %></p>					        
					        <span class="location-title"> 평점 :</span><span><%=avg1/10 %></span><br>
							<span class="location-title"> 팔로워 :</span><span><%=followList.size()%></span><br>
							<span class="location-title"> 팔로잉 :</span><span><%=followingList.size()%></span><br>					                
					      </div>
					    </div>
					</div>
                </div>
                <div class="col-md-8">
                    <div class="accordion" id="accordionMypage">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <img src="assets/icon/account_circle.png">
                                    <h4>나의 프로필</h4>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/grade.png">
                                                    <span>평점</span>
                                                </th>
                                                <td><%= avg1/10 %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/golf.png">
                                                    <span>골프 스코어</span>
                                                </th>
                                                <td><%if(member.getGametype().equals("field")){
                                                	%><%=member.getscore_field() %>
                                                	<%}else if(member.getGametype().equals("screen")){%>                                             
                                                	<%=member.getscore_screen()%>
                                                	<%}else{%>
                                                		0<%} %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/favorite.png">
                                                    <span>선호하는 게임타입</span>
                                                </th>
                                                <td><%if(member.getGametype().equals("field")){
                                                	%>Field
                                                	<%}else if(member.getGametype().equals("screen")){%>                                             
                                                		Screen
                                                	<%}else{%>
                                                		선호하는 게임이 없습니다.<%} %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/date_range.png">
                                                    <span>나이</span>
                                                </th>
                                                <td><%=member.getAge() %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/room.png">
                                                    <span>주소</span>
                                                </th>
                                                <td><%=member.getAddress() %></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <img src="assets/icon/message.png">
                                        <h4>받은 메세지</h4>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    <table class="table">
									  <thead>
									    <tr>
									      <th scope="col"> </th>
									      <th scope="col">보낸사람</th>
									      <th scope="col">메세지</th>
									      <th scope="col">받은날짜</th>
									      <th scope="col">삭제</th>
									    </tr>
									  </thead>
									  <tbody>
									    <% for(int i=0; i<messageList.size(); i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= messageList.get(i).getSender_nick() %></td>									      
									      <td><%= messageList.get(i).getMessage() %></td>
									      <td><%= messageList.get(i).getMessage_date() %></td>
									      <td><a href="MessageDeleteOne?num=<%= messageList.get(i).getMessage_id() %>"><img src="assets/icon/trash.png"></a></td>
									    </tr>	
									    <%} %>
									    </tbody>
									</table>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <img src="assets/icon/list.png">
                                        <h4>나의 그룹</h4>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    <% 
                                    	ArrayList<GameVO> groupList = new ArrayList<GameVO>();
                                    	groupList = memberDAO.getMyGroupList(member.getMember_id());
                                    %>
                                    <div class="row">
                                    	<% if(groupList.size() == 0) { %>
                                    		<span>현재 참여중인 그룹이 없습니다.</span>
                                    	<% } else { %>
	                                    	<% for(GameVO group : groupList) { %>
	                                    		<%
	                                    			int memberCnt = groupDAO.getGroupMemberCnt(group.getGame_id());
	                                    			int totalMembers = group.getTotal_member();
	                                    		%>
	                                    		<div class="profile-wrapper my-3 mx-auto">      
												    <div class="profile">
												      <div class="profile-image">
												        <a href="#group-detail-modal" data-bs-toggle="modal" onclick="groupDetail('<%= group.getGame_id() %>', '<%= group.getGame_type() %>')"><img src="<%= groupDAO.getGroupPic(group.getGame_id()) %>" alt="assets/profile_pic/default.jpg"></a>
												      </div>
												      <div class="profile-details">
												        <p><%= group.getGame_name() %></p>
												        <p><%= memberCnt %>/<%= totalMembers %></p>
												      </div>
												    </div>
												</div>
	                                    	<% } %>
                                    	<% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <img src="assets/icon/history.png">
                                        <h4>나의 그룹 참여기록</h4>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    <% 
                                    	ArrayList<GameVO> groupHistory = new ArrayList<GameVO>();
                                    	groupHistory = memberDAO.getMyGroupHistory(member.getMember_id());
                                    %>
                                    <div class="row">
                                    	<% if(groupHistory.size() == 0) { %>
                                    		<span>참여한 그룹 기록이 없습니다.</span>
                                    	<% } else { %>
	                                    	<% for(GameVO group : groupHistory) { %>
	                                    		<%
	                                    			int memberCnt = groupDAO.getGroupMemberCnt(group.getGame_id());
	                                    			int totalMembers = group.getTotal_member();
	                                    		%>
	                                    		<div class="profile-wrapper my-3 mx-auto">      
												    <div class="profile">
												      <div class="profile-image">
												        <a href="#group-detail-modal" data-bs-toggle="modal" onclick="groupDetail('<%= group.getGame_id() %>', '<%= group.getGame_type() %>')"><img src="<%= groupDAO.getGroupPic(group.getGame_id()) %>" alt="assets/profile_pic/default.jpg"></a>
												      </div>
												      <div class="profile-details">
												        <p><%= group.getGame_name() %></p>
												        <p><%= memberCnt %>/<%= totalMembers %></p>
												      </div>
												    </div>
												</div>
	                                    	<% } %>
                                    	<% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" >
                                    <img src="assets/icon/grade.png">
                                        <h4>팔로우</h4>           
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">                                    
                                    <h4>팔로워 리스트</h4>
                                    <table class="table">
									  <thead>
									    <tr>
									      <th scope="col"></th>
									      <th scope="col">닉네임</th>
									      <th scope="col">메세지</th>
									    </tr>
									  </thead>
									  <tbody>
									    <%for(int i=0; i<followList.size(); i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= followList.get(i)%></td>
									      <td><a data-bs-toggle="modal" href="#sendMsg" onclick="changeValue('<%= followList.get(i) %>')"><img src="assets/img/message.png"></a></td>									      
									    </tr>									    
									    <%} %>
									    <% if(followList.size() == 0) { %>
									    <tr>
									    	<th scope="row">#</th>
									    	<td>
									    		<span>팔로워가 없습니다.</span>
									    	</td>
									    	<td></td>
									    </tr>
									    <% } %>
									    </tbody>
									</table>        
									<h4>팔로잉 리스트</h4>
                                    <table class="table">
									  <thead>
									    <tr>
									      <th scope="col"></th>
									      <th scope="col">닉네임</th>
									      <th scope="col">메세지</th>
									    </tr>
									  </thead>
									  <tbody>
									    <%for(int i =0;i<followingList.size();i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= followingList.get(i)%></td>
									      <td><a data-bs-toggle="modal" href="#sendMsg" onclick="changeValue('<%= followingList.get(i) %>')"><img src="assets/img/message.png"></a></td>									      
									    </tr>									    
									    <%} %>
									    <% if(followingList.size() == 0) { %>
									    <tr>
									    	<th scope="row">#</th>
									    	<td>
									    		<span>팔로우하는 회원이 없습니다.</span>
									    	</td>
									    	<td></td>
									    </tr>
									    <% } %>
									  </tbody>
									</table>
									<div class="modal fade" id="sendMsg" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			        					<div class="modal-dialog">
				        					<form action="MessageService" id="messageForm">
				        						<input type="hidden" value="" name="receiver" id="receiverNick">
				            					<div class="modal-content">
				                					<div class="modal-header bg-light">
					                					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                					</div>
				                					<div class="modal-body">
			                        					<div>
			                            					<div>
			                                					<textarea name="message" id="message" class="form-control" cols="53" rows="5" placeholder="메시지를 입력하세요"></textarea>
			                            					</div> 
			                        					</div>
				                					</div>
				                					<div class="modal-footer bg-light">
					               				 		<button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
					                					<button type="submit" class="btn btn-outline-primary">보내기</button>
				                					</div>
				            					</div>
				       					 	</form>
			        					</div>
		    						</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <div id="group-detail-modal" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-xl modal-dialog-centered">
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<h5 class="modal-title">상세정보</h5>
	        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body iframe-detail">
	        	<iframe id="iframe-group" src="" class="iframe-detail" style="border="0" frameborder="0" allowTransparency="true"></iframe>
	        </div>
	    	<div class="modal-footer">
       		</div>
	    </div>
	  </div>
	</div>
    </section>
    <%@ include file="footer.html" %>
    <script type="text/javascript">
	    function changeValue(nick) {
	 	   document.getElementById("receiverNick").setAttribute('value', nick);
	 	}
	    
        function groupDetail(id,type) {
    	   document.getElementById("iframe-group").src = "mypageGroup.jsp?id="+id+"&type="+type;
    	}
	   
    </script>
</body>
</html>