<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/WEB-INF/css/styles.css">
<title>쿡엔코아</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <link href="../resources/css/login.css" rel="stylesheet" />
		<link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<form action="/user/login" method="post">
<img class="main-logo" 
	src="../resources/assets/main-logo.svg"

	alt="로딩오류"><br/>
<div class="login-form">
<label class="control-label" for="IDInput">아이디 입력</label>
<input class="form-control" id="IDInput"type="text" name="id" required><br/>
<label class="control-label" for="PWDInput">비밀번호 입력</label>
<input class="form-control" id="PWDInput" type="password" name="pwd" required><br/>
<input type="submit" class="btn btn-primary" value="Login">
<a href="/user/join"><input type="button" name="btnJoin" class="btn-default" value="회원가입"></a>
</div>
</form>

 <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../resources/js/scripts.js"></script>

</body>
</html>