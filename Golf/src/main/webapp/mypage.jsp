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
		MemberVO member = (MemberVO)session.getAttribute("member");
		double avg1=0;
		if(member.getRatings_total().equals("0")){
			avg1=0;
		}else{
			double total= Integer.parseInt(member.getRatings_total());
			double cnt = Integer.parseInt(member.getRatings_cnt());
			double avg=total/cnt;
			avg1=(double)Math.round(avg*100/10);
		}
		MessageDAO message = new MessageDAO();
		ArrayList<MessageVO> messagelist = new ArrayList<MessageVO>();
		messagelist = message.showMessage(Integer.parseInt(member.getMember_id()));
		FollowDAO dao = new FollowDAO();
		ArrayList<FollowVO> followlist = new ArrayList<FollowVO>();
		ArrayList<FollowVO> followinglist = new ArrayList<FollowVO>();
		if(member!=null){
			followlist= dao.ShowFollower(member.getMember_id());
			followinglist =dao.ShowFolloweing(member.getMember_id());
		}
		
		
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
					        <span class="location-title"> 평점 :</span><span><%= avg1/10 %></span><br>
							<span class="location-title"> 팔로워 :</span><span><%= followlist.size() %></span><br>
							<span class="location-title"> 팔로잉 :</span><span><%= followinglist.size() %></span><br>					                
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
                                    <h4>My Profile</h4>
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/grade.png">
                                                </th>
                                                <td><%= avg1/10  %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/golf.png">
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
                                                </th>
                                                <td><%=member.getAge() %></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/room.png">
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
                                        <h4>Recieved Message</h4>
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                	<table class="table">
									  <thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">NickName</th>
									      <th scope="col">Gender</th>
									    </tr>
									  </thead>
									  <tbody>
									    <%for(int i =0;i<followlist.size();i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= followlist.get(i).getNickname() %></td>
									      <td><%= followlist.get(i).getGender() %></td>									      
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
                                        <h4>My Games in Progress</h4>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    insert Sample Trump's golf groups in here
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFour">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                    <img src="assets/icon/history.png">
                                        <h4>My Games History</h4>
                                </button>
                            </h2>
                            <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    insert Sample Trump's group history here
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFive">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive" >
                                    <img src="assets/icon/grade.png">
                                        <h4>Follow</h4>
                                        
                                </button>
                            </h2>
                            <div id="collapseFive" class="accordion-collapse collapse" aria-labelledby="headingFive" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">                                    
                                    <a href="FollowTEST.jsp">팔로우서비스</a>
                                    <h4>팔로워 리스트</h4>
                                    <a href="DeleteService" class="button next scrolly">전체삭제하기</a>
                                    <table class="table">
									  <thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">받은날짜</th>
									      <th scope="col">보낸사람</th>
									      <th scope="col">메시지내용</th>
									    </tr>
									  </thead>
									  <tbody>
									    <%for(int i =0;i<messagelist.size();i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= messagelist.get(i).getMessage_date() %></td>
									      <td><%= messagelist.get(i).getSender_id() %></td>									      
									      <td><%= messagelist.get(i).getMessage() %></td>
									      <td><a href="MessageDeleteOne?num=<%= messagelist.get(i).getMessge_id() %>">삭제</a></td>
									    </tr>									    
									    <%} %>
									    </tbody>
									</table>
									<h4>팔로잉 리스트</h4>
                                    <table class="table">
									  <thead>
									    <tr>
									      <th scope="col">#</th>
									      <th scope="col">NickName</th>
									      <th scope="col">Gender</th>
									    </tr>
									  </thead>
									  <tbody>
									    <%for(int i =0;i<followinglist.size();i++){%>
									    <tr>
									      <th scope="row"><%= i+1 %></th>
									      <td><%= followinglist.get(i).getNickname() %></td>
									      <td><%= followinglist.get(i).getGender() %></td>									      
									    </tr>									    
									    <%} %>
									  </tbody>
									</table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="footer.html" %>
</body>
</html>