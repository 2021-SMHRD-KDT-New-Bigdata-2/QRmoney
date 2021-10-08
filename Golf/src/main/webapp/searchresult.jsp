<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>
	<%
		MemberVO member = (MemberVO)session.getAttribute("member");
	%>
	<% if(member == null) { %>
		<%@ include file= "navbar_non_member.jsp" %>
	<% } else { %>
		<%@ include file= "navbar_member.jsp" %>
	<% } %>
	    <section class="bg-section">
            <div class="container-fixed mx-auto search-result">
            	<div class="row">
            		
            	</div>
            </div>
        </section>
       <%@ include file="footer.html" %>
</body>
</html>