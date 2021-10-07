<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>
	<%
		MemberVO member = (MemberVO)session.getAttribute("member");
	%>
	<% if(member == null) { %>
		<%@ include file= "navbar_member.jsp" %>
	<% } else { %>
		<%@ include file= "navbar_member.jsp" %>
	<% } %>
	<!-- Masthead-->
      <header class="masthead">
          <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
              <div class="d-flex justify-content-center">
                  <div class="text-center">
                      <h1 class="mx-auto my-0 text-uppercase">Swing Mate</h1>
                      <h2 class="text-white-50 mx-auto mt-2 mb-5"></h2>
                      <div class="dropdown">
                          <button class="btn btn-primary dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Find GolfMate</button>
                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                              <li><a class="dropdown-item" href="#search" data-bs-toggle="modal">Join Others Group</a></li>
                              <li><a class="dropdown-item" href="#field-form" data-bs-toggle="modal">Find Field Mate</a></li>
                              <li><a class="dropdown-item" href="#screen-form" data-bs-toggle="modal">Find Screen Mate</a></li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
      </header>   
      <!-- About-->
      <section class="about-section text-center" id="about">
          <div class="container px-4 px-lg-5">
              <div class="row gx-4 gx-lg-5 justify-content-center">
                  <div class="col-lg-8">
                      <h2 class="text-white mb-4">Sample Text</h2>
                      <p class="text-white-50">
                          Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste dolorem quod odio, repudiandae suscipit recusandae inventore deserunt corrupti atque pariatur quisquam eum fugiat a, totam ab dolor esse nemo fuga?
                      </p>
                  </div>
              </div>
              <img class="img-fluid" src="assets/img/golfer.png" alt="..." />
          </div>
      </section>
      <!-- Projects-->
      <section class="projects-section bg-light" id="features">
          <div class="container px-4 px-lg-5">
              <!-- Featured Project Row-->
              <div class="row gx-0 mb-4 mb-lg-5 align-items-center">
                  <div class="col-xl-8 col-lg-7"><img class="img-fluid mb-3 mb-lg-0" src="assets/img/bg-masthead.jpg" alt="..." /></div>
                  <div class="col-xl-4 col-lg-5">
                      <div class="featured-text text-center text-lg-left">
                          <h4>Sample Text</h4>
                          <p class="text-black-50 mb-0">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur ut, suscipit in minima voluptates blanditiis. Voluptatem error numquam facere ut, quia blanditiis minus temporibus a animi? Cupiditate possimus culpa sed!</p>
                      </div>
                  </div>
              </div>
              <!-- Project One Row-->
              <div class="row gx-0 mb-5 mb-lg-0 justify-content-center">
                  <div class="col-lg-6"><img class="img-fluid" src="assets/img/demo-image-01.jpg" alt="..." /></div>
                  <div class="col-lg-6">
                      <div class="bg-black text-center h-100 project">
                          <div class="d-flex h-100">
                              <div class="project-text w-100 my-auto text-center text-lg-left">
                                  <h4 class="text-white">Sample Text</h4>
                                  <p class="mb-0 text-white-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore ratione reprehenderit deserunt dicta excepturi? Quo alias quaerat error reprehenderit animi voluptas veniam, distinctio autem aliquid consequuntur doloribus odio, in ratione.</p>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- Project Two Row-->
              <div class="row gx-0 justify-content-center">
                  <div class="col-lg-6"><img class="img-fluid" src="assets/img/demo-image-02.jpg" alt="..." /></div>
                  <div class="col-lg-6 order-lg-first">
                      <div class="bg-black text-center h-100 project">
                          <div class="d-flex h-100">
                              <div class="project-text w-100 my-auto text-center text-lg-right">
                                  <h4 class="text-white">Sample Text</h4>
                                  <p class="mb-0 text-white-50">Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolore ratione reprehenderit deserunt dicta excepturi? Quo alias quaerat error reprehenderit animi voluptas veniam, distinctio autem aliquid consequuntur doloribus odio, in ratione.</p>
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