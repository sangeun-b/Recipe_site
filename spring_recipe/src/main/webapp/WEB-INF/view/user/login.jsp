<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/WEB-INF/css/styles.css">
<title>쿡엔코아</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<form action="/user/login" method="post">
<img class="main-logo" 
	src="../resources/assets/main-logo.svg"
	alt="로딩오류">
ID:<input type="text" name="id"><br/>
PASSWORD:<input type="password" name="pwd"><br/>
<input type="submit" value="Login">
<a href="/user/join"><input type="button" name="btnJoin" value="Join"></a>
</form>
<script type="text/javascript" src="/WEB-INF/js/scripts.js"></script>
</body>
</html>