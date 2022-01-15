<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/myinfo.css" rel="stylesheet" />
<link href="../resources/css/styles.css" rel="stylesheet" />

<script>
const ckEdit =()=>{
	if(confirm("수정하시겠습니까?")==true){
		document.editForm.submit();
	}else{
		return false;
	}
}

const ckDel=()=>{
	if(confirm("탈퇴하시겠습니까?")==true){
		location.href="/user/out";
	}else{
		return false;
	}	
}

</script>
</head>
<body>
	<form name="editForm" action="/user/edit" method="post">
		<div class=aboutme>나의정보</div>
		<span class="myinfoframe">
		<div class=id_text>아이디</div>
		<div class=id>
			<input type="text" name="id" value="${u.id }" readonly
				style="border: none; background: transparent; padding: 9px;">
		</div>
		<div class=password_text>비밀번호</div>
		<div class=password>
			<input type="password" value="${u.pwd }" name="pwd"
				style="border: none; background: transparent;"><br />
		</div>
		<div class=repassword_text>비밀번호확인</div>
		<div class=repassword>
			<input type="password" name="pwd2"
				style="border: none; background: transparent;"><br />
		</div>
		<div class=email_text>이메일</div>
		<div class=email>
			<input type="email" value="${u.email }" name="email"
				style="border: none; background: transparent;"><br />
		</div>
		</span>
		<span class="buttonframe">
	
			<input class=change type="button" value="수정하기"
				onclick="ckEdit()">
		
<!-- 		<a href="/user/out"> -->
		<input class="delete_account" type="button" value="회원탈퇴" onclick="ckDel()"
			style="border: none;  padding: 8px;"> <br>
		
		</span>
		
	</form>
	<div class=myrecipe>
		<a href="/board/getbywriter/${u.id}"><input type="button"
			value="나의 레시피 보기" style="border: none; background: transparent;"></a>
		<br>
	</div>

	

</body>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/scripts.js"></script>
</html>