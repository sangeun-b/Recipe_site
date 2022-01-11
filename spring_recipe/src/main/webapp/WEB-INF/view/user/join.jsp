<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
const xhttp = new XMLHttpRequest();//비동기 요청 객체

//응답이 왔을때 자동 호출 //{flag:true}
xhttp.onload = function() {
	if(xhttp.readyState==4){//요청이 잘 갔는지 확인
		if(xhttp.status==200){//응답 결과 코드 . 500:논리적오류. 404:경로문제, 400:서버요구값이 전달안됐을때
			//let members = eval("("+xhttp.responseText+")");
			//alert(xhttp.responseText);
			let res = JSON.parse(xhttp.responseText);//배열
			let txt = "";
			//alert(res.flag);
			if(res.flag){
				if(res)
				txt = "가능한 아이디 입니다.";
			
			}else{
				txt = "이미 가입된 아이디 입니다.";
			}
			document.getElementById("res").innerHTML = txt;
		}else{
			alert("응답 error code:"+xhttp.status);
		}
	}else{
		alert("요청 error code:"+xhttp.readyState);
	}
  
}
const check=()=>{
	const idVal = document.getElementById("id").value;
	//alert(idVal);
	xhttp.open("GET", "/user/idcheck?id="+idVal);
	xhttp.send();
}
/* const idCheck=()=> {
	var id = document.getElementById("id").value;
	
	if(id.length < 8) {
		alert('아이디는 8글자 이상이여야 합니다.');
		return false;
	}

} */

 const pwdCheck=()=> {
	var pwd1 = document.getElementById("pwd").value;
	var pwd2 = document.getElementById("pwd2").value;
	
	if(pwd1.length < 8) {
		alert('비밀번호는 8글자 이상이여야 합니다.');
		return false;
	}
	
	if( pwd1 != pwd2 ) {
		alert("비밀번호가 서로 다릅니다");
		return false;
	} else {
		alert("비밀번호가 일치합니다");
		return true;
	}
}
 </script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<form action="/user/join" method="post">
ID: <input type="text" name="id" id="id">
<input type="button" value="Check" onclick="check()">
<div id="res"></div><br/>
PASSWORD: <input type="password" name="pwd" id="pwd"><br/>
RE-PASSWORD : <input type="password" name="pwd2" id="pwd2"><br/>
<input type="button" value="비밀번호 확인" onclick="pwdCheck()">
EMAIL: <input type="email" name="email"><br/>
<input type="submit" value="Join" >
<input type="reset" value="Reset" >
</form>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>