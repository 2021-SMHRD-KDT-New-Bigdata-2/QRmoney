<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<%@ include file= "head.html" %>
<body>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#SearchCondision">
	  �˻�
	</button>
	
	<!-- Search -->
	<div class="modal fade" id="SearchCondision" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="staticBackdropLabel">�˻� ����</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <form>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="ScreenCheck">
				  <label class="form-check-label" for="flexCheckDefault">
				    ��ũ��
				  </label>
				</div>
				<div class="form-check">
				  <input class="form-check-input" type="checkbox" value="" id="FieldCheck" checked>
				  <label class="form-check-label" for="flexCheckChecked">
				    �ʵ�
				  </label>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="�г���" aria-label="Checkbox for following text input" name="SearchNickName_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="Usernickname" aria-label="Usernickname" aria-describedby="basic-addon1" name="SearchNickName">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="������" aria-label="Checkbox for following text input" name="SearchMoney_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="Money" aria-label="money" aria-describedby="basic-addon1" name="SearchMoney">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-text">
	    				<input class="form-check-input mt-0" type="checkbox" value="�̸���" aria-label="Checkbox for following text input" name="UserEmail_Check">
	  				</div>
	  				<input type="text" class="form-control" placeholder="UserEmail" aria-label="UserEmail" aria-describedby="basic-addon1" name="UserEmail">
				</div>
					<div class="input-group mb-3">
  						
  						<label class="input-group-text" for="SearchGenderSelect">
  							<input class="form-check-input mt-0" type="checkbox" value="�Ÿ�" aria-label="Checkbox for following text input" name="Distance_Check">
  						</label>
  						<select class="form-select form-select-sm" id="SearchGenderSelect" >
  							<option selected>��������</option>
  							<option value="Men">����</option>
					  		<option value="Women">����</option>
					  		<option value="both">�ƹ���</option>
						</select>
					</div>
				<div class="input-group mb-3">
					
					<label for="SearchDistance" class="form-label">
						<input class="form-check-input mt-0" type="checkbox" value="�Ÿ�" aria-label="Checkbox for following text input" name="Distance_Check">
						&nbsp;&nbsp;�Ÿ�
					</label>
					<input type="range" class="form-range" id="SearchDistance" min="10" max="500" name="SearchDistance">
				
				</div>
				
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
	        <button type="button" class="btn btn-primary">Ȯ��</button>
	      </div>
	    </div>
	  </div>
	</div>
<%@ include file="footer.html" %>
</body>
</html>