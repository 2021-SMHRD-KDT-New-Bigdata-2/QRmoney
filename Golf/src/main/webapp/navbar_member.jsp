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
<nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="main.jsp">Swing Mate</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
            	<li class="nav-item"><a class="nav-link" href="#updateModal" data-bs-toggle="modal">ȸ������ ����</a></li>
            	<li class="nav-item"><a class="nav-link" href="mypage.jsp">����������</a></li>
                <li class="nav-item"><a class="nav-link" href="LogoutService">�α׾ƿ�</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- Search -->
	<div class="modal fade" id="fastOrSearch" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalToggleLabel">�׷� ã��</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="fastOrSearchModal">
      			<a href="javascript:void(0);" onclick="findlocation()" class="btn btn-secondary">���� ��Ī</a>
      			<button class="btn btn-primary" data-bs-target="#search" data-bs-toggle="modal" data-bs-dismiss="modal">���� �˻�</button>
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
              <h5 class="modal-title">�˻� ����</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
               <table class="table">
                   <tbody>
                     <tr>
                       <th scope="row">���� Ÿ��</th>
                       <td>
                           <div>
                               <input class="form-check-input " type="radio" name="game_type" value="field" required>
                               �ʵ�
                               <input class="form-check-input" type="radio" name="game_type" value="screen">
                               ��ũ�� ����
                           </div>
                       </td>
                     </tr>
                     <tr>
                       <th scope="row">����</th>
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
                         <th> ���� ���ھ�<br>
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
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
              <button type="submit" class="btn btn-primary">�˻�</button>
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
	              <h6 class="modal-title">  <b><%= vo.getNickname() %></b>��!<br>�Բ� �� ����Ʈ�� ���غ�����</h6>
	              <span class="small">
	              	���ھ� : 
	              	<%
		              	if(vo.getscore_field() == null) {
							out.print("���� �ȵ�");
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
                    <!-- <th scope="row">����</th> -->
                      <td colspan="2">
                        <div class="col-12" style="margin-left: auto;">
                          <div class="input-group">
                            <input type="text" placeholder = "[�ʵ�] �Խñ� ������ �Է����ּ���" class="form-control" name="game-name" required>
                          </div>
                        </div>    
                      </td>
                    </tr>
                  <tr>
                    <th scope="row">���</th>
                      <td>
                        <div class="col-sm-10" style="margin-left: auto;">
                          <div class="input-group">
                          	<input list="field-select" class="form-select" placeholder="��Ҹ� �������ּ���" name="location" required>
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
                    <th scope="row">��¥</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="datetime-local" class="form-control" name="game-date" required>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">������</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input type="number" class="form-control" name="game-fee" required>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">���ӱ���</th>
                    <td>
                      <div class="col-sm-10" style="margin-left: auto;">
                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault1" value="9 holes" checked>
                        <label class="form-check-label" for="flexRadioDefault1"> 9Ȧ </label>
                          
                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault2" value="18 holes">
                        <label class="form-check-label" for="flexRadioDefault2"> 18Ȧ </label>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <th scope="row">���ο�</th>
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
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
	          <button type="submit" class="btn btn-primary">�ۼ��Ϸ�</button>
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
	              <h6 class="modal-title">  <b><%= vo.getNickname() %></b>��!<br>�Բ� �� ����Ʈ�� ���غ�����</h6>
	              <span class="small">
	              	���ھ� : 
	              	<%
		              	if(vo.getscore_field() == null) {
							out.print("���� �ȵ�");
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
	                          <input type="text" placeholder = "[��ũ��] �Խñ� ������ �Է����ּ���" class="form-control" name="game-name" required>
	                        </div>
	                      </div>    
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">���</th>
	                      <td>
	                        <div class="col-sm-10" style="margin-left: auto;">
	                          <div class="input-group">
	                          	<input list="screen-select" class="form-select" placeholder="��Ҹ� �������ּ���" name="location" required>
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
	                    <th scope="row">��¥</th>
	                    <td>
	                      <div class="col-sm-10" style="margin-left: auto;">
	                        <input type="datetime-local" class="form-control" name="game-date" required>
	                      </div>
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">���ӱ���</th>
	                    <td>
	                      <div class="col-sm-10" style="margin-left: auto;">
	                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault1" value="9 holes" checked>
	                        <label class="form-check-label" for="flexRadioDefault1"> 9Ȧ </label>                          
	                        <input class="form-check-input" type="radio" name="game-length" id="flexRadioDefault2" value="18 holes">
	                        <label class="form-check-label" for="flexRadioDefault2"> 18Ȧ </label>
	                      </div>
	                    </td>
	                  </tr>
	                  <tr>
	                    <th scope="row">���ο�</th>
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
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
	          <button type="submit" class="btn btn-primary">�ۼ��Ϸ�</button>
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
	        <h5 class="modal-title" id="exampleModalLabel">������������</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </div>
	        <div class="modal-body">
                <div style="text-align: center;">
                    <label for="inputNickname"><b>�г���</b></label>
                </div>
                <div>
                    <label for="inputPassword">��й�ȣ</label>
                    <input type="password" class="form-control" id="inputPassword" name="password" size="15" required> 
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
                    <select class="form-select" id="inputGender" name="gender" aria-label="Example select with button addon">
                      <option selected disabled value="">������ �������ּ���</option>
                      <option value="male">����</option>
                      <option value="female">����</option>                   
                    </select>
                </div>
                <div>
                    <label for="inputTel">����ó</label>
                    <input type="tel" class="form-control" id="inputTel" name="contact" placeholder="010-0000-0000" value="">
                </div>     
                <!-- <div>
                    <label for="inputAddress">�ּ�</label>
                    <input id="inputAddress" name="address" class="form-control" type="text" placeholder="Ŭ���ؼ� �ּҸ� �Է����ּ���" readonly onclick="findAddr()" value="">
                </div> -->
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
        	</div>
	        <div class="modal-footer">
		        <button type="reset" class="btn btn-outline-secondary" data-bs-dismiss="modal">���</button>
		        <button type="submit" class="btn btn-outline-primary">���� �Ϸ�</button>
	        </div>
		</form>
    </div>
    </div>
  </div>
  <script>
    $('document').ready(function() {
        var area0 = ["���� ��ü","����Ư����","��õ������","����������","���ֱ�����","�뱸������","��걤����","�λ걤����","��⵵","������","��û�ϵ�","��û����","����ϵ�","���󳲵�","���ϵ�","��󳲵�","���ֵ�"];
        var area1 = ["��ü","������","������","���ϱ�","������","���Ǳ�","������","���α�","��õ��","�����","������","���빮��","���۱�","������","���빮��","���ʱ�","������","���ϱ�","���ı�","��õ��","��������","��걸","����","���α�","�߱�","�߶���"];
        var area2 = ["��ü","��籸","����","������","����","����","����","������","�߱�","��ȭ��","������"];
        var area3 = ["��ü","�����","����","����","������","�߱�"];
        var area4 = ["��ü","���걸","����","����","�ϱ�","����"];
        var area5 = ["��ü","����","�޼���","����","�ϱ�","����","������","�߱�","�޼���"];
        var area6 = ["��ü","����","����","�ϱ�","�߱�","���ֱ�"];
        var area7 = ["��ü","������","������","����","����","������","�λ�����","�ϱ�","���","���ϱ�","����","������","������","������","�߱�","�ؿ�뱸","���屺"];
        var area8 = ["��ü","����","��õ��","�����","���ֽ�","������","������","������","�����ֽ�","����õ��","��õ��","������","������","�����","�Ȼ��","�ȼ���","�Ⱦ��","���ֽ�","�����","���ν�","�ǿս�","�����ν�","��õ��","���ֽ�","���ý�","��õ��","�ϳ���","ȭ����","����","����","���ֱ�","��õ��"];
        var area9 = ["��ü","������","���ؽ�","��ô��","���ʽ�","���ֽ�","��õ��","�¹��","����","�籸��","��籺","������","������","������","ö����","��â��","ȫõ��","ȭõ��","Ⱦ����"];
        var area10 = ["��ü","��õ��","û�ֽ�","���ֽ�","���걺","�ܾ籺","������","������","��õ��","������","����","��õ��","û����"];
        var area11 = ["��ü","����","���ֽ�","����","���ɽ�","�����","�ƻ��","õ�Ƚ�","�ݻ걺","������","�ο���","��õ��","���ⱺ","���걺","û�籺","�¾ȱ�","ȫ����"];
        var area12 = ["��ü","��ü","�����","������","������","�ͻ��","���ֽ�","������","��â��","���ֱ�","�ξȱ�","��â��","���ֱ�","�ӽǱ�","�����","���ȱ�"];
        var area13 = ["��ü","�����","���ֽ�","������","��õ��","������","������","���ﱺ","���","���ʱ�","��籺","���ȱ�","������","�žȱ�","������","���ϱ�","�ϵ���","�强��","���ﱺ","������","����","�س���","ȭ����"];
        var area14 = ["��ü","����","���ֽ�","���̽�","��õ��","�����","���ֽ�","�ȵ���","���ֽ�","��õ��","���׽�","��ɱ�","������","��ȭ��","���ֱ�","������","���籺","��õ��","�︪��","������","�Ǽ���","û����","û�۱�","ĥ�"];
        var area15 = ["��ü","������","���ؽ�","�����","�о��","��õ��","����","���ֽ�","���ؽ�","â����","�뿵��","��â��","����","���ر�","��û��","�Ƿɱ�","â�籺","�ϵ���","�Ծȱ�","�Ծ籺","��õ��"];
        var area16 = ["��ü","��������","���ֽ�","�����ֱ�","�����ֱ�"];



        // ��/�� ���� �ڽ� �ʱ�ȭ

        $("#sido1").each(function() {
            $selsido = $(this);
            $.each(eval(area0), function() {
            $selsido.append("<option value='"+this+"'>"+this+"</option>");
            });
            $("#gugun1").append("<option value=''>��/�� ����</option>");
        }); 


         // ��/�� ���ý� ��/�� ����

        $("#sido1").change(function() {
            var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // ���������� ���� Array
            var $gugun = $("#gugun1"); // ���ÿ��� ���� ��ü
            $("option",$gugun).remove(); // ���� �ʱ�ȭ

            if(area == "area0")
                $gugun.append("<option value=''>��/�� ����</option>");
            else {
                $.each(eval(area), function() {
                $gugun.append("<option value='"+this+"'>"+this+"</option>");
                });
            }
        });
    });
  </script>