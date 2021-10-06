<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="main.jsp">Swing Mate</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <div class="dropdown">
                        <button class="dropdown-toggle btn-sm btn-primary" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
                            <h7>LOGIN</h7>
                        </button>
                      
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <li><a class="dropdown-item" href="signup.jsp">회원가입</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#LoginModal" data-bs-toggle="modal">로그인</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="LoginModal" tabindex="-1" aria-labelledby="ModalLogin" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h5 class="modal-title" id="LoginModalLabel">로그인을 해주세요</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<%@ include file="login_form.html" %>
			</div>
		</div>
	</div>
</div>