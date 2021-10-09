<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>
	<%@ include file= "navbar_non_member.jsp" %>
	<section class="container-fluid bg-section">
            <div class="row justify-content-center signup-form container-sm">
                
                <div>
                    <div class="text-center my-5">
                        <h3>회원가입</h3>
                    </div>
                    <form role="form" action="SignUpService" novalidate enctype="multipart/form-data" method="POST">
                        <div>
                            <div>
                                <label for="inputEmail">이메일 주소</label>
                            </div>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputEmail" name="emailFront" size="15" required>
                                <select class="form-select" aria-label="Example select with button addon" name="emailBack" required>
                                  <option selected disabled value="">이메일</option>
                                  <option value="@naver.com">@naver.com</option>
                                  <option value="@gmail.com">@gmail.com</option>
                                  <option value="@daum.net">@daum.net</option>
                                </select>
                                <div class="invalid-feedback">
                                    필수입력 항목입니다.
                                </div>
                            </div>
                        </div>
                        <div>
                            <label for="inputPassword">비밀번호</label>
                            <input type="password" class="form-control" id="inputPassword" name="password" size="15" required> 
                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>
                        <div>
                            <label for="inputNickname">닉네임</label>
                            <input type="text" class="form-control" id="inputNickname" name="nickname" required>
                            <div class="invalid-feedback">
                                필수입력 항목입니다.
                            </div>
                        </div>
                        <div>
                            <label for="inputProfile">프로필 사진</label>
                            <div class="input-group">
                                <input type="file" class="form-control" id="inputProfile" name="profilePic" aria-describedby="inputProfile" aria-label="Upload">
                            </div>
                        </div>
                        <div>
                            <label for="inputGender">성별</label>
                        </div>
                        <div class="input-group">
                            <select class="form-select" id="inpGender" name="gender" aria-label="Example select with button addon">
                              <option selected disabled value="">성별을 선택해주세요</option>
                              <option value="male">남성</option>
                              <option value="female">여성</option>                   
                            </select>
                        </div>
                        <div>
                            <label for="inputTel">연락처</label>
                            <input type="tel" class="form-control" id="inputTel" name="contact" placeholder="010-0000-0000" value="">
                        </div>
                        <div>
                            <label for="inputAge">나이</label>
                            <input type="number" class="form-control" id="inputAge" name="age" min="0" max="999" value="">
                        </div>     
                        <div>
                            <label for="inputGameType">선호 게임 타입</label>
                        </div>
                        <div class="input-group">
                            <select class="form-select" id="inputGameType" name="gameType" aria-label="Example select with button addon">
                              <option selected disabled value="">게임 타입을 선택해주세요</option>
                              <option value="field">필드</option>
                              <option value="screen">스크린</option>
                            </select>
                        </div>
                        <div>
                            <div>
                                <label for="inputFieldScore">필드 스코어</label>
                                <input type="number" min="0" max="999" class="form-control" id="inputFieldScore" name="fieldScore" value="">
                            </div>
                            <div>
                                <label for="inputScreenScore">스크린 스코어</label>
                                <input type="number" min="0" max="999" class="form-control" id="inputScreenScore" name="screenScore" value="">
                            </div>
                        </div>
                        <div>
                            <label for="inputAddress">주소</label>
                            <input id="inputAddress" name="address" class="form-control" type="text" placeholder="클릭해서 주소를 입력해주세요" readonly onclick="findAddr()" value="">
                        </div>
                        <div class="form-group text-center my-4">
                            <button type="submit" id="join-submit" class="btn btn-primary">
                                회원가입<i class="fa fa-check spaceLeft"></i>
                            </button>
                            <a class="btn btn-secondary" href="main.jsp">
                            	가입취소<i class="fa fa-times spaceLeft"></i>
                            </a>                            
                        </div>
                    </form>
                </div> 
            </div>
	</section>
	<%@ include file="footer.html" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>