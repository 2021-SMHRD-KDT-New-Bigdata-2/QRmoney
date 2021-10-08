<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<%@ include file= "navbar_member.jsp" %>
<body>
	<!-- Masthead-->
	<header class="masthead">
	    <div class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
	        <div class="d-flex justify-content-center">
	            <div class="text-center">
	                <h1 class="mx-auto my-0 text-uppercase">Swing Mate</h1>
	                <h2 class="text-white-50 mx-auto mt-2 mb-5"></h2>
	                <div class="dropdown">
	                    <button class="btn btn-primary dropdown-toggle" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Find Mate</button>
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
	<!-- My page-->
    <section class="projects-section bg-light" id="mypage">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="text-center">
                        <a href=#><img class="profile-pic250" src="assets/profile_pic/sample.jpg"></a>
                        <!--프로필 사진 변경-->
                  
                        <h2>Sample Trump</h2>

                        <hr>

                        <p class="lead">Lorem ipsum, dolor sit amet consectetur adipisicing elit.</p>
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
                                                <td>4.4</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/golf.png">
                                                </th>
                                                <td>99</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/favorite.png">
                                                </th>
                                                <td>Field</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/date_range.png">
                                                </th>
                                                <td>46/06/14</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">
                                                    <img src="assets/icon/room.png">
                                                </th>
                                                <td>Whitehouse</td>
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
                                    insert Sample Trump's Message Screen here
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
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <img src="assets/icon/grade.png">
                                        <h4>Manner</h4>
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionMypage">
                                <div class="accordion-body">
                                    insert Sample Trump's golf groups in here
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