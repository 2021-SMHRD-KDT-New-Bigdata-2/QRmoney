<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<body>
	<%@ include file= "navbar_non_member.jsp" %>
	<section class="container-fluid bg-section">
            <div class="row justify-content-center signup-form container-sm">
                
                <div>
                    <div class="text-center my-5">
                        <h3>ȸ������</h3>
                    </div>
                    <form role="form" action="SignUpService" novalidate enctype="multipart/form-data" method="POST">
                        <div>
                            <div>
                                <label for="inputEmail">�̸��� �ּ�</label>
                            </div>
                            <div class="input-group">
                                <input type="text" class="form-control" id="inputEmail" name="emailFront" size="15" required>
                                <select class="form-select" aria-label="Example select with button addon" name="emailBack" required>
                                  <option selected disabled value="">�̸���</option>
                                  <option value="@naver.com">@naver.com</option>
                                  <option value="@gmail.com">@gmail.com</option>
                                  <option value="@daum.net">@daum.net</option>
                                </select>
                                <div class="invalid-feedback">
                                    �ʼ��Է� �׸��Դϴ�.
                                </div>
                            </div>
                        </div>
                        <div>
                            <label for="inputPassword">��й�ȣ</label>
                            <input type="password" class="form-control" id="inputPassword" name="password" size="15" required> 
                            <div class="invalid-feedback">
                                �ʼ��Է� �׸��Դϴ�.
                            </div>
                        </div>
                        <div>
                            <label for="inputNickname">�г���</label>
                            <input type="text" class="form-control" id="inputNickname" name="nickname" required>
                            <div class="invalid-feedback">
                                �ʼ��Է� �׸��Դϴ�.
                            </div>
                        </div>
                        <div>
                            <label for="inputProfile">������ ����</label>
                            <div class="input-group">
                                <input type="file" class="form-control" id="inputProfile" name="profilePic" aria-describedby="inputProfile" aria-label="Upload">
                            </div>
                        </div>
                        <div>
                            <label for="inputGender">����</label>
                        </div>
                        <div class="input-group">
                            <select class="form-select" id="inpGender" name="gender" aria-label="Example select with button addon">
                              <option selected disabled value="">������ �������ּ���</option>
                              <option value="male">����</option>
                              <option value="female">����</option>                   
                            </select>
                        </div>
                        <div>
                            <label for="inputTel">����ó</label>
                            <input type="tel" class="form-control" id="inputTel" name="contact" placeholder="010-0000-0000" value="">
                        </div>
                        <div>
                            <label for="inputAge">����</label>
                            <input type="number" class="form-control" id="inputAge" name="age" min="0" max="999" value="">
                        </div>     
                        <div>
                            <label for="inputGameType">��ȣ ���� Ÿ��</label>
                        </div>
                        <div class="input-group">
                            <select class="form-select" id="inputGameType" name="gameType" aria-label="Example select with button addon">
                              <option selected disabled value="">���� Ÿ���� �������ּ���</option>
                              <option value="field">�ʵ�</option>
                              <option value="screen">��ũ��</option>
                            </select>
                        </div>
                        <div>
                            <div>
                                <label for="inputFieldScore">�ʵ� ���ھ�</label>
                                <input type="number" min="0" max="999" class="form-control" id="inputFieldScore" name="fieldScore" value="">
                            </div>
                            <div>
                                <label for="inputScreenScore">��ũ�� ���ھ�</label>
                                <input type="number" min="0" max="999" class="form-control" id="inputScreenScore" name="screenScore" value="">
                            </div>
                        </div>
                        <div>
                            <label for="inputAddress">�ּ�</label>
                            <input id="inputAddress" name="address" class="form-control" type="text" placeholder="Ŭ���ؼ� �ּҸ� �Է����ּ���" readonly onclick="findAddr()" value="">
                        </div>
                        <div class="form-group text-center my-4">
                            <button type="submit" id="join-submit" class="btn btn-primary">
                                ȸ������<i class="fa fa-check spaceLeft"></i>
                            </button>
                            <a class="btn btn-secondary" href="main.jsp">
                            	�������<i class="fa fa-times spaceLeft"></i>
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