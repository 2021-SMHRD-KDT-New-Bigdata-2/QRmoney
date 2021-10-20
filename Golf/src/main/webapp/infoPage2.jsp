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
<style>
     	#MemberRate fieldset{
		    display: inline-block; /* ���� ���� �̹������� �ִ� ������ �ڸ��� ������.*/
		    direction: rtl;
		    border: 0; /* �ʵ�� �׵θ� ���� */
		}
		#MemberRate fieldset legend{
		    text-align: left;
		}
		#MemberRate input[type=radio]{
		    display: none; /* �����ڽ� ���� */
		}
		#MemberRate label{
		    font-size: 3em; /* �̸��� ũ�� */
		    color: transparent; /* ���� �̸��� �÷� ���� */
		    text-shadow: 0 0 0 #f0f0f0; /* �� �̸��� ���� �ο� */
		}
		#MemberRate label:hover{
		    text-shadow: 0 0 0 #ffd400; /* ���콺 ȣ�� */
		}
		#MemberRate label:hover ~ label{
		    text-shadow: 0 0 0 #ffd400; /* ���콺 ȣ�� �ڿ����� �̸����� */
		}
		#MemberRate input[type=radio]:checked ~ label{
    		text-shadow: 0 0 0 #ffd400; /* ���콺 Ŭ�� üũ */
		}
</style>
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
                	<table class="table mt-5 mb-2 table-hover" >
	                <tbody class="profile-table">
	                    <tr>
		                    <th scope="row" class="col-md-4">�г���</th>
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
                <div class="my-4 float-end">
                	<a class="btn btn-primary" data-bs-toggle="modal" href="#ratingModal">���ϱ�</a>
	                <a class="btn btn-primary" data-bs-toggle="modal" href="#sendMsg">�޼���������</a>
	                <% if(chk) { %>
	                	<a class="btn btn-primary" href="UnfollowService?nickName=<%=profile.getNickname()%>">���ȷο�</a>
	                <% } else { %>
	                	<a class="btn btn-primary" href="followService2?nickName=<%=profile.getNickname()%>">�ȷο�</a>
	                <% } %>
	            </div>
                </div>
                <div class="modal fade" id="sendMsg" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			        <div class="modal-dialog">
				        <form action="MessageService" id="messageForm">
				        	<input type="hidden" name="receiver" value="<%= profile.getNickname() %>">
				            <div class="modal-content">
				                <div class="modal-header bg-light">
					                <h5 class="modal-title" id="exampleModalLabel" >�޽��� ������</h5>
					                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				                </div>
				                <div class="modal-body">
			                        <div>
			                            <div >
			                                <textarea name="message" id="message" class="form-control" cols="53" rows="5" placeholder="�޽����� �Է��ϼ���"></textarea>
			                            </div> 
			                        </div>
				                </div>
				                <div class="modal-footer bg-light">
					                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">���</button>
					                <button type="submit" class="btn btn-outline-primary">������</button>
				                </div>
				            </div>
				        </form>
			        </div>
		    	</div>
		    	<div class="modal fade" id="ratingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				    <div class="modal-dialog">
				    	<form name="MemberRate" id="MemberRate" method="post" action="RatingService">
					      <div class="modal-content row">
					        <div class="modal-header bg-light">
					            <div class="col-md-9">
					                <h6 class="modal-title2"> <%= profile.getNickname() %>���� ��� �ųʴ� �����?</h6>
					            </div>        
					       	</div>
					       	<input type="hidden" value="<%= profile.getNickname() %>" name="nickname">
					        <div class="modal-body">
					       			<fieldset>			    
								        <legend>���� �ųʸ� �����ּ���</legend>
								        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">��</label>
								        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">��</label>
								        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">��</label>
								        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">��</label>
								        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">��</label>
							    	</fieldset>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">������</button>
					          <button type="submit" class="btn btn-primary" >�����ϱ�</button>
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