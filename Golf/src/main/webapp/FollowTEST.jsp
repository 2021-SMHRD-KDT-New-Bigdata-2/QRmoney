<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="FollowService">
		<label>팔로우할사람</label><br>
		<input type=email name="Startfollow"><br>
		<label>팔로우끊을사람</label><br>
		<input type=email name="cancelfollow"><br>
		<input type="submit" value="전송"><br>
	</form>

</body>
</html>