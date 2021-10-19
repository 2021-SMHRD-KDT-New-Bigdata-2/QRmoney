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
	<!-- Masthead-->
      <header class="masthead">
          <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
              <div class="d-flex justify-content-center">
                  <div class="text-center">
                      <h1 class="mx-auto mb-5 text-uppercase">Swing Mate</h1>
                    <div>
	                    <% if(member == null) { %>
							<a href="#LoginModal" data-bs-toggle="modal"><img class="btn-main" src="assets/img/search.png"></a>
		                    <a href="#LoginModal" data-bs-toggle="modal"><img class="btn-main" src="assets/img/field.png"></a>
		                    <a href="#LoginModal" data-bs-toggle="modal"><img class="btn-main" src="assets/img/screen.png"></a>
		                    
						<% } else { %>
							<a href="#fastOrSearch" data-bs-toggle="modal"><img class="btn-main" src="assets/img/search.png"></a>
		                    <a href="#field-form" data-bs-toggle="modal"><img class="btn-main" src="assets/img/field.png"></a>
		                    <a href="#screen-form" data-bs-toggle="modal"><img class="btn-main" src="assets/img/screen.png"></a>
						<% } %>
                    </div>
                  </div>
              </div>
          </div>
      </header>   
      <%@ include file="footer.html" %>
</body>
<script>
    function moveloctaion(latitude,longitude){
        location.href = "FastGameService?Latiude="+latitude+"&longitude="+longitude;
    }
    
    function findlocation(){	
    	if('geolocation' in navigator) {
    		navigator.geolocation.getCurrentPosition((position) => {
                moveloctaion(position.coords.latitude, position.coords.longitude)
    			});
    	} else {
    		function error() {
                status.textContent = '현재위치를 찾을수 없습니다.';
                }

                if(!navigator.geolocation) {
                status.textContent = '당신의 브라우져에서는 위치검색기능이 안됩니다. 브라우져를 바꾸세요.';
                } else {
                status.textContent = '찾고잇음.…';
                navigator.geolocation.getCurrentPosition(success, error);
            }
    	}	
    }
		
</script>
</html>