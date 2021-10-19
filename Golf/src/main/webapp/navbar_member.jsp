<%@page import="com.model.ScreenVO"%>
<%@page import="com.model.ScreenDAO"%>
<%@page import="com.model.FieldVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.FieldDAO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% MemberVO vo = (MemberVO)session.getAttribute("member"); %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="js/cropper.js"></script>
<link rel="stylesheet" href="css/cropper.css">
<script src="js/jquery-cropper.js"></script>
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="main.jsp">Swing Mate</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
            	<li class="nav-item"><a class="nav-link" href="#updateModal" data-bs-toggle="modal">회원정보 수정</a></li>
            	<li class="nav-item"><a class="nav-link" href="mypage.jsp">마이페이지</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutService">로그아웃</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Search -->
	<div class="modal fade" id="fastOrSearch" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalToggleLabel">그룹 찾기</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="fastOrSearchModal">
      			<a href="javascript:void(0);" onclick="findlocation()" class="btn btn-secondary">빠른 매칭</a>
      			<button class="btn btn-primary" data-bs-target="#search" data-bs-toggle="modal" data-bs-dismiss="modal">직접 검색</button>
	      	</div>
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" id="search" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <form action="SearchGameService">
            <div class="modal-header bg-light">
              <h5 class="modal-title">검색 조건</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <table class="table">
                   <tbody>
                     <tr>
                       <th scope="row">게임 타입</th>
                       <td>
                           <div>
                               <input class="form-check-input " type="radio" name="game_type" value="field" required>
                               필드
                               <input class="form-check-input" type="radio" name="game_type" value="screen">
                               스크린 골프
                           </div>
                       </td>
                     </tr>
                     <tr>
                       <th scope="row">지역</th>
                       <td>
                           <div class="row">
                             <div class="col-7">
                               <select class="form-select" name="sido1" id="sido1"></select> 
                             </div>
                             <div class="col-5">
                               <select class="form-select" name="gugun1" id="gugun1"></select>
                             </div>
                           </div>
                       </td>
                     </tr>
                     <tr>
                         <th> 골프 스코어<br>
                         </th>
                         <td>
                         	<output>70</output>
                           <input type="range" class="form-range" value="70" min="0" max="140" id="customRange2" name="score" oninput="this.previousElementSibling.value = this.value">
                         </td>
                     </tr>
                   </tbody>
               </table>
            </div>
            <div class="modal-footer bg-light">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
              <button type="submit" class="btn btn-primary">검색</button>
            </div>
            </form>
	    </div>
	  </div>
	</div>
<!-- field -->
  <div id="field-form" class="modal fade" tabindex="-1">
    <div class="modal-dialog" >
      <div class="modal-content">
      	<form action="MakeGameField">
	        <div class="modal-header bg-light">
	          <div class="row">
	            <div class="col-2">
	              <img class="profile-pic50" src=<%= "assets/profile_pic/"+ vo.getProfilePic() %>>
	            </div>
	            <div class="col-10">
	              <h6 class="modal-title">  <b><%= vo.getNickname() %></b>님!<br>함께 할 메이트를 구해보세요</h6>
	              <span class="small">
	              	스코어 : 
	              	<%
		              	if(vo.getscore_field() == null) {
							out.print("설정 안됨");
		         		} else {
		         			out.print(vo.getscore_field());
		         		}
	              	%>
	              </span>
	            </div>
	          </div>
	        </div>
	        <div class="modal-body">
            <table class="table">
                <tbody>
                  <tr>
                    <!-- <th scope="row">제목</th> -->
                      <td colspan="2">
                        <div class="col-12" style="margin-left: auto;">
                          <div class="input-group">
                            <input type="text" placeholder = "[필드] 게시글 제목을 입력해주세요" class="form-control" name="game-name" required>
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">장소</th>
                      <td>
                        <div class="col-sm-10" style="margin-left: auto;">
                          <div class="input-group">
                          	<input list="field-select" class="form-select" placeholder="장소를 선택해주세요" name="location" required>
	                            <datalist id="field-select">
	                            	<% FieldDAO fieldDAO = new FieldDAO(); %>
	                            	<% ArrayList<FieldVO> field_list = fieldDAO.getFieldList(); %>
	                            	<% 
	                            		for(FieldVO field : field_list) {
	                            			out.print("<option value='"+field.getName()+"'>"+field.getAddress()+"</option>");
	                            		} 
	                            	%>
	                            </datalist>
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">날짜</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="datetime-local" class="form-control" name="game-date" required>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">지참금</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="number" class="form-control" name="game-fee" required>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">게임길이</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault1" value="9 holes" checked>
                        <label class="form-check-label" for="flexRadioDefault1"> 9홀 </label>
                          
                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault2" value="18 holes">
                        <label class="form-check-label" for="flexRadioDefault2"> 18홀 </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">총인원</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="number" class="form-control" min="2" max="4" name="total-member" required>
                      </div>
                    </td>
                  </tr>
                </tbody>
            </table>
	        </div>
	        <div class="modal-footer bg-light">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          <button type="submit" class="btn btn-primary">작성완료</button>
	        </div>
        </form>
      </div>
    </div>
  </div>

  <!-- screen -->
  <div id="screen-form" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
      	<form action="MakeGameScreen">
	        <div class="modal-header bg-light">
	          <div class="row">
	            <div class="col-2">
	              <img class="profile-pic50" src=<%= "assets/profile_pic/"+ vo.getProfilePic() %>>
	            </div>
	            <div class="col-10">
	              <h6 class="modal-title">  <b><%= vo.getNickname() %></b>님!<br>함께 할 메이트를 구해보세요</h6>
	              <span class="small">
	              	스코어 : 
	              	<%
		              	if(vo.getscore_field() == null) {
							out.print("설정 안됨");
		         		} else {
		         			out.print(vo.getscore_screen());
		         		}
	              	%>
	              </span>
	            </div>
	          </div>
	        </div>
	        <div class="modal-body">
	            <table class="table">
	                <tbody>
	                  <tr>
	                    <td colspan="2">
	                      <div class="col-12" style="margin-left: auto;">
	                        <div class="input-group">
	                          <input type="text" placeholder = "[스크린] 게시글 제목을 입력해주세요" class="form-control" name="game-name" required>
	                        </div>
	                      </div>    
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">장소</th>
	                      <td>
	                        <div class="col-sm-10" style="margin-left: auto;">
	                          <div class="input-group">
	                          	<input list="screen-select" class="form-select" placeholder="장소를 선택해주세요" name="location" required>
		                            <datalist id="screen-select">
		                            	<% ScreenDAO screenDAO = new ScreenDAO(); %>
		                            	<% ArrayList<ScreenVO> screen_list = screenDAO.getScreenList(); %>
		                            	<% 
		                            		for(ScreenVO screen : screen_list) {
		                            			out.print("<option value='"+screen.getName()+"'>"+screen.getAddress()+"</option>");
		                            		} 
		                            	%>
		                            </datalist>
	                          </div>
	                        </div>    
	                      </td>
	                    </tr>
	                  <tr>
	                    <th scope="row">날짜</th>
	                    <td>
	                      <div class="col-sm-10" style="margin-left: auto;">
	                        <input type="datetime-local" class="form-control" name="game-date" required>
	                      </div>
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">게임길이</th>
	                    <td>
	                      <div class="col-sm-10" style="margin-left: auto;">
	                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault1" value="9 holes" checked>
	                        <label class="form-check-label" for="flexRadioDefault1"> 9홀 </label>                          
	                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault2" value="18 holes">
	                        <label class="form-check-label" for="flexRadioDefault2"> 18홀 </label>
	                      </div>
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">총인원</th>
	                    <td>
	                      <div class="col-sm-10" style="margin-left: auto;">
	                        <input type="number" class="form-control" min="2" max="4" name="total-member" required>
	                      </div>
	                    </td>
	                  </tr>
	                </tbody>
	            </table>
	        </div>
	        <div class="modal-footer bg-light">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          <button type="submit" class="btn btn-primary">작성완료</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
  <!-- update -->
  <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    	<form action="UpdateService" id="tmpSendFrm" enctype="multipart/form-data" method="post">
	        <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">개인정보수정</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
                <div style="text-align: center;">
                    <label for="inputNickname"><b>닉네임</b></label>
                </div>
                <div>
                    <label for="inputPassword">비밀번호</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" size="15" required> 
                    <div class="invalid-feedback">
                        필수입력 항목입니다.
                    </div>
                </div>
                <div>
                    <label for="inputProfile">프로필 사진</label>
                    <div class="input-group">
                        <!-- <input type="file" class="form-control" id="inputProfile" name="profilePic" aria-describedby="inputProfile" aria-label="Upload"> -->
                        <a href="#profileupload" class="btn-sm btn-primary" data-bs-target="#profileupload" data-bs-toggle="modal" data-bs-dismiss="modal">사진 업로드</a>
                    </div>
                </div>
                <div>
                    <label for="inputGender">성별</label>
                </div>
                <div class="input-group">
                    <select class="form-select" id="inputGender" name="gender" aria-label="Example select with button addon">
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
        	</div>
	        <div class="modal-footer">
		        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="submit" class="btn btn-outline-primary">수정 완료</button>
	        </div>
		</form>
    </div>
    </div>
  </div>
  <div class="modal fade" id="profileupload" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	        
	        <div class="photo_box">
	            <div class="upload_btn">
	                <div class="upload">
	                    <input type="file" name="photoBtn" accept="image/jpeg, imape/png" capture="camera" id='photoBtn'><label for="photoBtn">사진 업로드</label>
	                </div>
	            </div>
	            <div class="reupload_btn">
	                <a href="javascript:void(0);" id="resetPhoto">다시 업로드하기</a>
	            </div>
	            <div class="photo_them">
	                <div class="them_img">
	                    <img id="image" src="">
	                </div>
	            </div>
	            <a href="javascript:void(0);" id="complete" data-bs-dismiss="modal">업로드</a>
	        </div>
	      </div>
	     </div>
	  </div>
	</div>
<style>
.inputProfileUpload{width:40%; height: 650px; float: left; margin-bottom: 20px;}
	.inputbarbar{width: 60%;float: left; margin-bottom: 20px;}
	.photo_box{margin:0 auto; max-width: 500px;}
    .upload_btn{overflow:hidden;width: 100%;}    
    .upload_btn #photoBtn{display: none;}
    .upload_btn .upload{float: center;text-align: center;text-decoration: none;color: #fff;padding: 15px 0;background-color: steelblue;}
    .reupload_btn a{display:block; margin-top: 10px;margin-bottom: 10; background: #ccc;text-align: center;text-decoration: none;color: #fff;padding: 15px 0; width: 100%;}
    .photo_them{position: relative;margin-top: 20px;width: 100%;height: 600px;background: #eee;}
    .them_img, .result_box{position: absolute;top: 0;left: 0;width: 100%;height: 100%;}
    .result_box{background: #fff;}
    .them_img img, .result_box img{display: block;margin: 0 auto;height: 100%;}
    #complete{display: block;margin-top: 20px;padding: 15px 0;width: 100%;text-align: center;color: #fff;text-decoration: none;background-color: steelblue;} 
</style>
<script>
    $(function(){
        var cropper;
        // 사진 업로드 버튼
        $('#photoBtn').on('change', function(){
            $('.them_img').empty().append('<img id="image" src="">');
            var image = $('#image');
            var imgFile = $('#photoBtn').val();
            var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
            
            // 이미지가 확장자 확인 후 노출
            if(imgFile.match(fileForm)) {
                var reader = new FileReader(); 
                reader.onload = function(event) { 
                    image.attr("src", event.target.result);
                    cropper = image.cropper( {
                    	dragMode: 'crop',  
                    	width:300,
                        height:600,
                        viewMode:0,
						minCropBoxHeight:200, 
                        minCropBoxWidth:100,
                        toggleDragModeOnDblclick: false
                        
                    });
                    
                }; 
                reader.readAsDataURL(event.target.files[0]);
            } else{
                alert("이미지 파일(jpg, png형식의 파일)만 올려주세요");
                $('#photoBtn').focus();
                return; 
            }
        });
        // 사진 다시 올리기 버튼
        $('#resetPhoto').on('click', function(){
            if($('input[type="file"]').val() != ""){
                $('#photoBtn').val('');
                $('.them_img img').attr('src','').remove();
                $('.btn_wrap a:last-child').removeClass('bg1');
                $('input[type="file"]').click();
            }else{
                //alert('업로드된 사진이 없습니다.');
            }
        });
        // 업로드 버튼
        $('#complete').on('click', function(){
            $('.them_img').append('<div class="result_box"><img id="result" src=""></div>');
            var image = $('#image');
            var result = $('#result');
            var canvas;
            if($('input[type="file"]').val() != ""){
            canvas = image.cropper('getCroppedCanvas',{
                width:300,
                height:600
            });
            result.attr('src',canvas.toDataURL("image/jpg"));

            canvas.toBlob(function (blob) {
                var formData = new FormData();
                formData.append("cutimage", blob, 'cuting.png')

                $.ajax({
                	url:"Cutimage",
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function () {
                        alert('업로드 성공');
                        $(".btn-profile").attr("src", canvas.toDataURL("image/jpg"));
                    },
                    error: function () {
                        alert('업로드 실패');
                        $('.result_box').remove()
                    },
                });
            })
        }else{
            alert('사진을 업로드 해주세요');
            $('input[type="file"]').focus();
            return;
        }
        });
    });
</script>
  <script>
    $('document').ready(function() {
        var area0 = ["전국 전체","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
        var area1 = ["전체","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
        var area2 = ["전체","계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
        var area3 = ["전체","대덕구","동구","서구","유성구","중구"];
        var area4 = ["전체","광산구","남구","동구","북구","서구"];
        var area5 = ["전체","남구","달서구","동구","북구","서구","수성구","중구","달성군"];
        var area6 = ["전체","남구","동구","북구","중구","울주군"];
        var area7 = ["전체","강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
        var area8 = ["전체","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
        var area9 = ["전체","강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
        var area10 = ["전체","제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
        var area11 = ["전체","계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
        var area12 = ["전체","전체","군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
        var area13 = ["전체","광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
        var area14 = ["전체","경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
        var area15 = ["전체","거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
        var area16 = ["전체","서귀포시","제주시","남제주군","북제주군"];



        // 시/도 선택 박스 초기화

        $("#sido1").each(function() {
            $selsido = $(this);
            $.each(eval(area0), function() {
            $selsido.append("<option value='"+this+"'>"+this+"</option>");
            });
            $("#gugun1").append("<option value=''>구/군 선택</option>");
        }); 


         // 시/도 선택시 구/군 설정

        $("#sido1").change(function() {
            var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
            var $gugun = $("#gugun1"); // 선택영역 군구 객체
            $("option",$gugun).remove(); // 구군 초기화

            if(area == "area0")
                $gugun.append("<option value=''>구/군 선택</option>");
            else {
                $.each(eval(area), function() {
                $gugun.append("<option value='"+this+"'>"+this+"</option>");
                });
            }
        });
    });
  </script>