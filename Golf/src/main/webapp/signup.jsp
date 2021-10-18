<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file= "head.html" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
<script src="js/cropper.js"></script>
<link rel="stylesheet" href="css/cropper.css">   
<script src="js/jquery-cropper.js"></script>
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
                        <div class="inputbarbar">
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
                             <div>
                        
                            <label for="inputAddress">주소</label>
                            <input id="inputAddress" name="address" class="form-control" type="text" placeholder="클릭해서 주소를 입력해주세요" readonly onclick="findAddr()" value="">
                        	</div>
                        </div>
                        </div>
                        <div class="inputProfileUpload">
                            <label for="inputProfile">프로필 사진</label>
                            <div class="input-group">
                                <a href="#profileupload" data-bs-toggle="modal" class="inputProfile"><img class="btn-main" id="img button"src="assets/profile_pic/default.jpg"></a>
                        	</div>
                       	</div>
                       </div><br>
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
	
<div class="modal fade" id="profileupload" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        
        <div class="photo_box">
            <div class="upload_btn">
                <div class="upload">
                    <input type="file" name="photoBtn" accept="image/jpeg, imape/png" capture="camera" id='photoBtn'><label for="photoBtn">사진 첨부할래?</label>
                </div>
            </div>
            <div class="reupload_btn">
                <a href="javascript:void(0);" id="resetPhoto">다시 할래?</a>
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
	
	<%@ include file="footer.html" %>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

                $.ajax('/SignUpService', {
                    method: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function () {
                        alert('업로드 성공');
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

</body>
<style>
	.inputProfileUpload{width:20%;float: right; margin-bottom: 120px}
	.inputbarbar{width: 80%;float: left; margin-bottom: 20px}
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
</html>

                        