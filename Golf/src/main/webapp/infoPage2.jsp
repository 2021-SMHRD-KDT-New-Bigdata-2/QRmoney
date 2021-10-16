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
		String nickname = request.getParameter("nickName");
		MemberDAO memberDAO = new MemberDAO();
		MemberVO profile = memberDAO.getInfo(nickname);
		MemberVO member = (MemberVO)session.getAttribute("member");	
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
					        <span class="location-title"> ���� :</span><span></span><br>
							<span class="location-title"> �ȷο� :</span><span></span><br>
							<span class="location-title"> �ȷ��� :</span><span></span><br>					                
					      </div>
					    </div>
					</div>
                </div>
                <div class="col-md-8">
                	<table class="table my-5 table-hover" >
	                <tbody>
	                    <tr>
		                    <th scope="row" >�г���</th>
		                    <td><%=vo.getNickname()  %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">����</th>
		                    <td><%=vo.getAge()  %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">����</th>
		                    <td ><%=vo.getGender() %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">��ȣ ����Ÿ��</th>
		                    <td ><%=vo.getGametype() %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">��ũ�� ���ھ�</th>
		                    <td><%=vo.getscore_screen() %></td>
	                    </tr>
	                    <tr>
		                    <th scope="row">�ʵ� ���ھ�</th>
		                    <td ><%=vo.getscore_field() %></td>
	                    </tr>
	                </tbody>
                </table>
                <button class="btn btn-primary">�޼��� ������</button>
                <% if(true) { %>
                	<a class="btn btn-primary">���ȷο�</a>
                <% } else { %>
                	<a class="btn btn-primary">�ȷο�</a>
                <% } %>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="footer.html" %>
</body>
</html>