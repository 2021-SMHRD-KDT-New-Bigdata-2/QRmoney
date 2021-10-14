<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div style="width: 400px; height: 400px">
		<% String game_id = request.getParameter("id"); %>
		<h1><%= game_id %></h1>
	</div>
</body>
</html>