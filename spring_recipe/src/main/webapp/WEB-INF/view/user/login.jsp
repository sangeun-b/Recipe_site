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
<!-- <div class="logo"> -->
<!-- <img id="mainlogo" class="mainlogo" src="../resources/assets/main-logo.svg" alt="로딩오류" width="400" height="300"> -->
<!-- </div> -->
<!-- <div class="login"> -->
<!-- <form action="/user/login" method="post"> -->
<!-- <div class="info"> -->
<!-- 아이디 입력<br/> -->
<!-- <input type="text" class="inputinfo" id="id" name="id" required><br/> -->
<!-- 비밀번호 입력<br/> -->
<!-- <input type="password" class="inputinfo" id="pwd" name="pwd" required><br/> -->
<!-- <input type="submit" class="btnLogin" value="로그인"> -->
<!-- <a href="/user/join"><input type="button" name="btnJoin" class="btnJoin" value="회원가입"></a> -->
<!-- </div> -->
<!-- </form> -->
<!-- </div> -->
<div class="logo">
<img id="mainlogo" class="mainlogo" src="../resources/assets/main-logo.svg" alt="로딩오류" width="300" height="300">
</div>
<div class="loginform">
<form action="/user/login" method="post">
<div class="info">
<div class="idckall" id="idckall">
아이디 입력</br>
<input type="text" name="id" id="id" class="inputinfo" required>
</div>
<div class="pwdckall" id="pwdckall">
비밀번호 입력<br/><input type="password" name="pwd" id="pwdck1" class="inputinfo" required><br/>
</div>
<input type="submit" class="btnLogin" value="로그인" >
<input type="button" onclick="location.href='/user/join'" class="btnJoin" value="회원가입" >
</div>
</form>
</div>
 <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../resources/js/scripts.js"></script>

</body>
</html>