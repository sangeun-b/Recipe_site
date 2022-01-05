<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/WEB-INF/css/styles.css">
<title>Insert title here</title>
</head>
<body>
<form action="/user/login" method="post">
ID:<input type="text" name="id"><br/>
PASSWORD:<input type="password" name="pwd"><br/>
<input type="submit" value="Login">
<a href="/user/join"><input type="button" name="btnJoin" value="Join"></a>
</form>
<script type="text/javascript" src="/WEB-INF/js/scripts.js"></script>
</body>
</html>