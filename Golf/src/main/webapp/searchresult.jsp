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
		GroupDAO groupDAO = new GroupDAO();
		if(gameList.isEmpty()) {
			out.print("<script>"
					+"alert('검색조건에 맞는 그룹이 없습니다.\n메인 페이지로 돌아갑니다');"
					+"location.href = 'main.jsp';"
					+"</script>");
		}
	%>
	<% if(member == null) { %>
		<%@ include file= "navbar_non_member.jsp" %>
	<% } else { %>
		<%@ include file= "navbar_member.jsp" %>
	<% } %>
		<div id="group-detail" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-xl modal-dialog-centered">
		    <div class="modal-content">
		    	<iframe id="group-iframe" src=""></iframe>
		    </div>
		  </div>
		</div>
	    <section class="bg-section">
            <div class="container-sm mx-auto search-result">
            	<div class="row">
            		<div class="col mt-4">
            			<p><strong><%= gameList.size() %></strong>개의 그룹이 있어요</p>
            			<hr>
            		</div>
            	</div>
           		<div class="row">
           			<% for(GameVO game : gameList) { %>
         				<div class="profile-wrapper my-3 mx-auto">      
						    <div class="profile">
						      <div class="profile-image">
						        <a href="#group-detail" data-bs-toggle="modal" onclick="changeSrc(<%= game.getGame_id() %>)"><img src="<%= groupDAO.getGroupPic(game.getGame_id()) %>" alt="assets/profile_pic/default.jpg"></a>
						      </div>
						      <div class="profile-details">
						        <p><%= game.getLocation_name() %></p>
						        <p><%= groupDAO.getGroupMemberCnt(game.getGame_id()) %>/<%= game.getTotal_member() %></p>
						        <br>
						        <span class="location-title"> <%= game.getLocation_address() %> </span>        
						      </div>
						    </div>
						</div>
           			<% } %>
           		</div>
            </div>
        </section>
       <%@ include file="footer.html" %>
       <script type="text/javascript">
	       function changeSrc(id) {
	    	   document.getElementById("group-iframe").src = "test.jsp?id="+id;
	    	}
       </script>
</body>
</html>