<%@page import="com.model.MemberDAO"%>
<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
    <link href="css/styles.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <title>Document</title>
</head>
<body>

	<%
		String nickName = "asd";
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getInfo(nickName);
		
		if(vo == null){
			System.out.println("vo 안 넘어옴");
		}else{
			System.out.println("vo넘어옴   "+vo.getAge());
		}
		
	%>
    <div class="row" style="margin-top: 10%;">
            <form> 
                <div><img src="assets/profile_pic/sample.jpg" width="200px" style="margin-left: 40%;"></div>
                <div class="container-sm col-8">
                <div style="margin-top: 5%;"></div>
                <table class="table table-striped table-hover" >
                <tbody>
                    <tr>
                    <th scope="row" >닉네임</th>
                    <td><%=vo.getNickname()  %></td>
                    </tr>
                    <tr>
                    <th scope="row">나이</th>
                    <td><%=vo.getAge()  %></td>
                    </tr>
                    <tr>
                    <th scope="row">성별</th>
                    <td ><%=vo.getGender() %></td>
                    </tr>
                    <tr>
                    <th scope="row">선호 게임타입</th>
                    <td ><%=vo.getGametype() %></td>
                    </tr>
                    <tr>
                    <th scope="row">스크린 스코어</th>
                    <td><%=vo.getscore_screen() %></td>
                    </tr>
                    <tr>
                    <th scope="row">필드 스코어</th>
                    <td ><%=vo.getscore_field() %></td>
                    </tr>
                </tbody>
                </table>
                <div style="text-align: right;">
                    <div class="container">
                        <div class="btn-group" role="group" aria-label="...">
                          <button type="button" class="btn btn-default button-class1">팔로우</button>
                          <button type="button" class="btn btn-primary button-class2">언팔로우</button>
                        </div>                      
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        $(function() {

            $('.button-class1').click(function(){
	            if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
	            if( !$(this).hasClass('btn-primary') ) $(this).addClass('btn-primary');
	            if( $('.button-class2').hasClass('btn-primary') ) $('.button-class2').removeClass('btn-primary');
	            if( !$('.button-class2').hasClass('btn-default') ) $('.button-class2').addClass('btn-default');
	            location.href = "followService2?nickname=<%=nickName%>";
            });

            $('.button-class2').click(function(){
	            if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
	            if( !$(this).hasClass('btn-primary') ) $(this).addClass('btn-primary');
	            if( $('.button-class1').hasClass('btn-primary') ) $('.button-class1').removeClass('btn-primary');
	            if( !$('.button-class1').hasClass('btn-default') ) $('.button-class1').addClass('btn-default');
	            location.href = "followService2?nickname=<%=nickName%>";
            });

        });
    </script>
</body>
</html>