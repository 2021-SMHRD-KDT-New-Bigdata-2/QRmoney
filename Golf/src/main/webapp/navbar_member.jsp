<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="main.jsp">Swing Mate</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
            	<li class="nav-item"><a class="nav-link" href="mypage.jsp#mypage">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutService">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Search -->
	<div class="modal fade" id="search" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">검색 조건</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form>
	        	<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
				  <label class="form-check-label" for="flexRadioDefault1">
				    필드
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
				  <label class="form-check-label" for="flexRadioDefault2">
				    스크린
				  </label>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="닉네임" aria-label="Checkbox for following text input" name="SearchNickName_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="Usernickname" aria-label="Usernickname" aria-describedby="basic-addon1" name="SearchNickName">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="지참금" aria-label="Checkbox for following text input" name="SearchMoney_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="Money" aria-label="money" aria-describedby="basic-addon1" name="SearchMoney">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="이메일" aria-label="Checkbox for following text input" name="UserEmail_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="UserEmail" aria-label="UserEmail" aria-describedby="basic-addon1" name="UserEmail">
				</div>
					<div class="input-group mb-3">
  						
  						<label class="input-group-text" for="SearchGenderSelect">
  							<input class="form-check-input mt-0" type="checkbox" value="거리" aria-label="Checkbox for following text input" name="Distance_Check">
  						</label>
  						<select class="form-select form-select-sm" id="SearchGenderSelect" >
  							<option selected>성별선택</option>
  							<option value="Men">남자</option>
					  		<option value="Women">여자</option>
					  		<option value="both">아무나</option>
						</select>
					</div>
				<div class="input-group mb-3">
					
					<label for="SearchDistance" class="form-label">
						<input class="form-check-input mt-0" type="checkbox" value="거리" aria-label="Checkbox for following text input" name="Distance_Check">
						&nbsp;&nbsp;거리
					</label>
					<input type="range" class="form-range" id="SearchDistance" min="10" max="500" name="SearchDistance">
				
				</div>
				
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <a class="btn btn-primary" href="searchresult.jsp">확인</a>
	      </div>
	    </div>
	  </div>
	</div>
<!-- field -->
  <div id="field-form" class="modal" tabindex="-1">
    <div class="modal-dialog" >
      <div class="modal-content">
        <div class="modal-header bg-light">
          <div class="row">
            <div class="col-md-2">
              <img class="profile-pic50" src="assets/profile_pic/sample.jpg">
            </div>
            <div class="col-10">
              <h6 class="modal-title">  <b>트럼프</b>님! 함께 할 메이트를 직접 구해보세요</h6><!--여기에 본인 프사랑 함께 나왔으면 좋겠음-->
              <span class="small">성별 : 남성, 스코어 : 444, 거주지역 : 백악관</span>
            </div>
          </div>
        </div>
        <div class="modal-body">
          <form action="">
            <table class="table">
                <tbody>
                  <tr>
                    <!-- <th scope="row">제목</th> -->
                      <td colspan="2">
                        <div class="col-12" style="margin-left: auto;">
                          <div class="input-group">
                            <input type="text" placeholder = "[필드] 게시글 제목을 입력해주세요" class="form-control">
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">장소</th>
                      <td>
                        <div class="col-sm-10" style="margin-left: auto;">
                          <div class="input-group">
                            <input type="text" class="form-control">
                            <button class="btn-sm btn-primary" type="button" id="button-addon2">검색</button>
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">날짜</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="datetime-local" class="form-control">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">지참금</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="input" class="form-control">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">게임길이</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1"> 9홀 </label>
                          
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2"> 18홀 </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">총인원</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="number" class="form-control" min="2" max="4">
                      </div>
                    </td>
                  </tr>
                </tbody>
            </table>
          </form>
        </div>
        <div class="modal-footer bg-light">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary">작성완료</button>
        </div>
      </div>
    </div>
  </div>

  <!-- screen -->
  <div id="screen-form" class="modal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <div class="row">
            <div class="col-md-2">
              <img class="profile-pic50" src="assets/profile_pic/sample.jpg">
            </div>
            <div class="col-10">
              <h6 class="modal-title">  <b>트럼프</b>님! 함께 할 메이트를 직접 구해보세요</h6>
              <span class="small">성별 : 남성, 스코어 : 444, 거주지역 : 백악관</span>
            </div>
          </div>
        </div>
        <div class="modal-body">
          <form action="">
            <table class="table">
                <tbody>
                  <tr>
                    <td colspan="2">
                      <div class="col-12" style="margin-left: auto;">
                        <div class="input-group">
                          <input type="text" placeholder = "[스크린] 게시글 제목을 입력해주세요" class="form-control">
                        </div>
                      </div>    
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">장소</th>
                      <td>
                        <div class="col-sm-10" style="margin-left: auto;">
                          <div class="input-group">
                            <input type="text" class="form-control">
                            <button class="btn-sm btn-outline-primary" type="button" id="button-addon2">검색</button>
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">날짜</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="datetime-local" class="form-control">
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">게임길이</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1"> 9홀 </label>
                          
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2"> 18홀 </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">총인원</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="number" class="form-control" min="2" max="4">
                      </div>
                    </td>
                  </tr>
                </tbody>
            </table>
          </form>    
        </div>
        <div class="modal-footer bg-light">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary">작성완료</button>
        </div>
      </div>
    </div>
  </div>