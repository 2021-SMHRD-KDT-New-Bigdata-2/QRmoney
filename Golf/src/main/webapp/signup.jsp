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
                        <h3>ȸ������</h3>
                    </div>
                    <form role="form" action="SignUpService" novalidate enctype="multipart/form-data" method="POST">
                        <div>
                        <div class="inputbarbar">
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
                             <div>
                        
                            <label for="inputAddress">�ּ�</label>
                            <input id="inputAddress" name="address" class="form-control" type="text" placeholder="Ŭ���ؼ� �ּҸ� �Է����ּ���" readonly onclick="findAddr()" value="">
                        	</div>
                        </div>
                        </div>
                        <div class="inputProfileUpload">
                            <label for="inputProfile">������ ����</label>
                            <div class="input-group">
                                <a href="#profileupload" data-bs-toggle="modal" class="inputProfile"><img class="btn-main" id="img button"src="assets/profile_pic/default.jpg"></a>
                        	</div>
                       	</div>
                       </div><br>
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
	
<div class="modal fade" id="profileupload" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        
        <div class="photo_box">
            <div class="upload_btn">
                <div class="upload">
                    <input type="file" name="photoBtn" accept="image/jpeg, imape/png" capture="camera" id='photoBtn'><label for="photoBtn">���� ÷���ҷ�?</label>
                </div>
            </div>
            <div class="reupload_btn">
                <a href="javascript:void(0);" id="resetPhoto">�ٽ� �ҷ�?</a>
            </div>
            <div class="photo_them">
                <div class="them_img">
                    <img id="image" src="">
                </div>
            </div>
            <a href="javascript:void(0);" id="complete" data-bs-dismiss="modal">���ε�</a>
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
        // ���� ���ε� ��ư
        $('#photoBtn').on('change', function(){
            $('.them_img').empty().append('<img id="image" src="">');
            var image = $('#image');
            var imgFile = $('#photoBtn').val();
            var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
            
            // �̹����� Ȯ���� Ȯ�� �� ����
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
                alert("�̹��� ����(jpg, png������ ����)�� �÷��ּ���");
                $('#photoBtn').focus();
                return; 
            }
        });
        // ���� �ٽ� �ø��� ��ư
        $('#resetPhoto').on('click', function(){
            if($('input[type="file"]').val() != ""){
                $('#photoBtn').val('');
                $('.them_img img').attr('src','').remove();
                $('.btn_wrap a:last-child').removeClass('bg1');
                $('input[type="file"]').click();
            }else{
                //alert('���ε�� ������ �����ϴ�.');
            }
        });
        // ���ε� ��ư
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
                        alert('���ε� ����');
                    },
                    error: function () {
                        alert('���ε� ����');
                        $('.result_box').remove()
                    },
                });
            })
        }else{
            alert('������ ���ε� ���ּ���');
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

                        