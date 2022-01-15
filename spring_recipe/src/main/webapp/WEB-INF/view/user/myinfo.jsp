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
<div class="editform" >
<form name="editForm" action="/user/edit" method="post">
<div class="myinfo">나의 정보</div>
<div class="info">
<div class="idckall" id="idckall">
아이디</br>
<input type="text" name="id" id="id" class="inputinfo" value="${u.id }" readonly><br/>
</div>
<div class="pwdckall" id="pwdckall">
비밀번호 <br/><input type="password" name="pwd" id="pwdck1" class="inputinfo" value="${u.pwd }"><br/>
비밀번호 확인<br/><input type="password" name="pwd2" id="pwdck2" class="inputinfo" value="${u.pwd }">
</div>
이메일 <br/><input type="email" name="email"class="inputinfo" value="${u.email }"><br/>
<div class="btns">
<input type="button" class="btnEdit" value="수정하기" onclick="ckEdit()" >
<input type="button" class="btnDel" value="회원탈퇴" onclick="ckDel()" >
</div>
<a href="/board/getbywriter/${u.id}"><input type="button" class="btnMy" value="나의레시피 보기" ></a>
</div>
</form>
</div>
</body>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/scripts.js"></script>
</html>