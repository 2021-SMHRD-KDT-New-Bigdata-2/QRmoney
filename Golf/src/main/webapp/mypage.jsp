<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<%@ include file= "navbar_member.jsp" %>
<body>  
	<!-- My page-->
    <section class="bg-section" id="mypage">
        <div class="container-sm search-result mx-auto">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-wrapper my-5 mx-auto">      
						<div class="profile">
					      <div class="profile-image">
					        <img src="https://i.pinimg.com/564x/7e/97/30/7e973039c0d1ed0dec6c83051642daac.jpg" alt="profile one">
					      </div>
					      <div class="profile-details">
					        <p>닉네임</p>
					        <br>
					        <span class="location-title"> 평점 </span>        
					      </div>
					    </div>
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