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
	    <section class="container-fluid bg-section" id="">
            <div class="search-result-list">
                <ul class="list-group">
                        <small>4444개의 그룹이 있어요</small>
                    <hr>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="search-result-list-item my-3">
                                    <img src="assets/profile_pic/sample.jpg" class="profile-pic50">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="my-3">
                                    <h4 class="lead"><a href="#">청와대 골퍼들</a></h4>
                                    <small class="text-success">10/21 16:00</small>
                                    <p>서울특별시 종로구 세종로 청와대로 1</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="search-result-list-item my-4">
                                    <h3>1/4</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="search-result-list-item mx-2 my-3">
                                    <a href="" class="btn btn-primary">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="search-result-list-item my-3">
                                    <img src="assets/profile_pic/sample.jpg" class="profile-pic50">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="my-3">
                                    <h4 class="lead"><a href="#">청와대 골퍼들</a></h4>
                                    <small class="text-success">10/21 16:00</small>
                                    <p>서울특별시 종로구 세종로 청와대로 1</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="search-result-list-item my-4">
                                    <h3>1/4</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="search-result-list-item mx-2 my-3">
                                    <a href="" class="btn btn-primary">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="search-result-list-item my-3">
                                    <img src="assets/profile_pic/sample.jpg" class="profile-pic50">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="my-3">
                                    <h4 class="lead"><a href="#">청와대 골퍼들</a></h4>
                                    <small class="text-success">10/21 16:00</small>
                                    <p>서울특별시 종로구 세종로 청와대로 1</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="search-result-list-item my-4">
                                    <h3>1/4</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="search-result-list-item mx-2 my-3">
                                    <a href="" class="btn btn-primary">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="search-result-list-item my-3">
                                    <img src="assets/profile_pic/sample.jpg" class="profile-pic50">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="my-3">
                                    <h4 class="lead"><a href="#">청와대 골퍼들</a></h4>
                                    <small class="text-success">10/21 16:00</small>
                                    <p>서울특별시 종로구 세종로 청와대로 1</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="search-result-list-item my-4">
                                    <h3>1/4</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="search-result-list-item mx-2 my-3">
                                    <a href="" class="btn btn-primary">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="row">
                            <div class="col-md-1">
                                <div class="search-result-list-item my-3">
                                    <img src="assets/profile_pic/sample.jpg" class="profile-pic50">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="my-3">
                                    <h4 class="lead"><a href="#">청와대 골퍼들</a></h4>
                                    <small class="text-success">10/21 16:00</small>
                                    <p>서울특별시 종로구 세종로 청와대로 1</p>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="search-result-list-item my-4">
                                    <h3>1/4</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="search-result-list-item mx-2 my-3">
                                    <a href="" class="btn btn-primary">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <hr>
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">6</a></li>
						<li class="page-item"><a class="page-link" href="#">7</a></li>
						<li class="page-item"><a class="page-link" href="#">8</a></li>
						<li class="page-item"><a class="page-link" href="#">9</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
            </div>
        </section>
       <%@ include file="footer.html" %>
</body>
</html>