<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<style>
.myinfo-form {
	width:300px; 
	height:36px; 
	border-radius:3px; 
	line-height:36px
	color:black; 
	display: block;
	margin-left: auto;
	margin-right: auto;
	}
	
	img { display: block; margin: 0px auto; }
</style>
<body>
<img class="main-logo" 
	src="../resources/assets/main-logo.svg"
	alt="로딩오류"><br/>
	
	<div class="myinfo-form">
<h3>내 정보</h3>
<form action="/user/edit" method="post">
아이디<br/><input type="text" name="id" value="${u.id }" class="myinfo-form" readonly><br/>
비밀번호<br/><input type="password" value="${u.pwd }" name="pwd"class="myinfo-form" ><br/>
비밀번호 재입력<br/><input type="password" name="pwd2" class="myinfo-form" ><br/>
이메일<br/><input type="email" value="${u.email }" name="email" class="myinfo-form" ><br/>
<input type="submit" value="수정" class="btn btn-primary">
<a href=""><input type="button" value="내 목록" class="btn btn-primary"></a>
<a href="/user/out"><input type="button" value="삭제" class="btn btn-primary"></a>
	</div>
</form>
</body>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</html>