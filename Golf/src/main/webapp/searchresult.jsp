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
            <div class="container-sm mx-auto search-result">
            	<div class="row">
            		<div class="col mt-4">
            			<p><strong>354</strong>개의 그룹이 있어요</p>
            			<hr>
            		</div>
            	</div>
           		<div class="row">
         			<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="http://static.jtbcgolf.joins.com/jtbcgolf/data/news/32822.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://pds.joins.com/news/component/htmlphoto_mmdata/202104/27/d0ad43fe-1382-4cb8-bbd3-0ccb73dcbf05.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://m.mbcsportsplus.com/data/board/attach/2021/09/20210902155109_sxyzxkah.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.guim.co.uk/img/media/a96f33218d43118d1c11be257954f92161caf736/0_796_2784_1671/master/2784.jpg?width=1200&height=630&quality=85&auto=format&fit=crop&overlay-align=bottom%2Cleft&overlay-width=100p&overlay-base64=L2ltZy9zdGF0aWMvb3ZlcmxheXMvdGctZGVmYXVsdC5wbmc&s=c1393b858096e1fc9ef8858eaee421b3" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://pds.skyedaily.com/top_image/201808/76856_p.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://pyxis.nymag.com/v1/imgs/b9f/b30/4ca126f782b012474f31a574bf39bc4686-01-trump-playing-golf.rsquare.w700.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
					<div class="profile-wrapper my-3 mx-auto">      
					    <div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>전주 상그릴라 CC</p>
					        <p>3/4</p>
					        <br>
					        <span class="location-title"> 전북 임실 </span>        
					      </div>
					    </div>
					</div>
           		</div>
            </div>
        </section>
       <%@ include file="footer.html" %>
</body>
</html>