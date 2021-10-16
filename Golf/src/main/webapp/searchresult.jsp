<%@page import="com.model.GroupDAO"%>
<%@page import="com.model.GameVO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>
	<%
		MemberVO member = (MemberVO)session.getAttribute("member");
		ArrayList<GameVO> gameList = (ArrayList<GameVO>)session.getAttribute("searchResult");
		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		GroupDAO groupDAO = new GroupDAO();
		int cnt = 0;
	%>
	<% if(member == null) { %>
		<%@ include file= "navbar_non_member.jsp" %>
	<% } else { %>
		<%@ include file= "navbar_member.jsp" %>
	<% } %>
		<div id="group-detail" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl modal-dialog-centered">
		    <div class="modal-content">
		    	<div class="modal-header">
		    		<h5 class="modal-title">������</h5>
		        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
		        <div class="modal-body iframe-detail">
		        	<iframe id="group-iframe" src="" class="iframe-detail" style="border="0" frameborder="0" allowTransparency="true"></iframe>
		        </div>
		    	<div class="modal-footer">
		        	<a id="join-game" href="JoinGroupService" class="btn btn-primary mx-auto">�����ϱ�</a>
	       		</div>
		    </div>
		  </div>
		</div>
	    <section class="bg-section">
            <div class="container-sm mx-auto search-result">
            	<div class="row">
            		<div class="mt-4">
            			<p>�˻����</p>
            			<hr>
            		</div>
            	</div>
           		<div class="row">
           			<% for(int i = 0; i<gameList.size(); i++) { %>
           				<%
           					int memberCnt = groupDAO.getGroupMemberCnt(gameList.get(i).getGame_id());
           					int totalMembers = gameList.get(i).getTotal_member();
           					memberList = groupDAO.getGroupMemberVO(gameList.get(i).getGame_id());
           					boolean mygame = false;
           					for(MemberVO vo : memberList) {
           						if(vo.getMember_id().equals(member.getMember_id())) {
           							mygame = true; 
           						}
           					}
           				%>
           				<% if(totalMembers <= memberCnt || mygame) { %>
           				<% } else { %>
         				<div class="profile-wrapper my-3 mx-auto">      
						    <div class="profile">
						      <div class="profile-image">
						        <a href="#group-detail" data-bs-toggle="modal" onclick="changeSrc(<%= i %>,<%= gameList.get(i).getGame_id() %>)"><img src="<%= groupDAO.getGroupPic(gameList.get(i).getGame_id()) %>" alt="assets/profile_pic/default.jpg"></a>
						      </div>
						      <div class="profile-details">
						        <p><%= gameList.get(i).getLocation_name() %></p>
						        <p><%= memberCnt %>/<%= totalMembers %></p>
						        <br>
						        <span class="location-title"> <%= gameList.get(i).getLocation_address() %> </span>        
						      </div>
						    </div>
						</div>
						<% cnt++; %>
						<% } %>
           			<% } %>
           			<% if(cnt == 0) { %>
           			<div class="my-4 text-center">
            			<p>�˻��� �׷��� �����ϴ�, ���� �׷��� ��������.</p>
            			<br>
            			<a href="main.jsp">���� �׷� ���鷯����</a>
            		</div>
           			<% } %>
           		</div>
            </div>
        </section>
       <%@ include file="footer.html" %>
       <script type="text/javascript">
	       function changeSrc(id,gameid) {
	    	   document.getElementById("group-iframe").src = "searchresultdetail.jsp?id="+id;
	    	   document.getElementById("join-game").href = "JoinGroupService?id="+gameid;
	    	}
	   
       </script>
</body>
</html>