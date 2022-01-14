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
			let res = JSON.parse(xhttp.responseText);//배열
			let txt = "";
			var imgCk=document.getElementById("idck");
			const box = document.getElementById("idckall");
			if(res.flag){
				if(res){
					if(document.getElementById("idtxt")){
						document.getElementById("idtxt").remove();
						}
				const newP = document.createElement("span");
				newP.setAttribute("id","idtxt");
				imgCk.src="../../resources/assets/recipe_icons/check.png";
				imgCk.style.display="";
				txt ="사용 가능한 아이디입니다.";
				box.appendChild(newP);
				document.getElementById("idtxt").innerHTML="사용가능한 아이디입니다.";
				return res.flag;
				}
			}else{
				if(document.getElementById("idtxt")){
				   document.getElementById("idtxt").remove();
				}
				const newP = document.createElement("span");
				newP.setAttribute("id","idtxt");
				txt = "이미 가입된 아이디 입니다.";
				imgCk.src="../../resources/assets/recipe_icons/close.png";
				imgCk.style.display="";
				box.appendChild(newP);
				document.getElementById("idtxt").innerHTML="이미 가입된 아이디 입니다.";
				alert(res.flag);
				return res.flag;
			}
			
		}else{
			alert("응답 error code:"+xhttp.status);
		}
	}else{
		alert("요청 error code:"+xhttp.readyState);
	}
  
}
const check=()=>{
	const idVal = document.getElementById("id").value;
	if(!idVal){
		var imgCk=document.getElementById("idck");
		var box = document.getElementById("idckall");
		if(document.getElementById("idtxt")){
			document.getElementById("idtxt").remove();
			}
		const newP = document.createElement("span");
		newP.setAttribute("id","idtxt");
		imgCk.src="../../resources/assets/recipe_icons/check.png";
		imgCk.style.display="";
		box.appendChild(newP);
		document.getElementById("idtxt").innerHTML="아이디를 입력하세요.";
	}else{
	xhttp.open("GET", "/user/idcheck?id="+idVal);
	var idck = xhttp.send();
	}
	return idck;
}
 const Validation=()=> {
// 	var checkId = check();
// 	alert(res.flag);
// 	if(!res.flag){
// 		return false;
// 	}
// 	const idVal = document.getElementById("id").value;
// 	if(!idVal){
// 		var imgCk=document.getElementById("idck");
// 		var box = document.getElementById("idckall");
// 		if(document.getElementById("idtxt")){
// 			document.getElementById("idtxt").remove();
// 			}
// 		const newP = document.createElement("span");
// 		newP.setAttribute("id","idtxt");
// 		imgCk.src="../../resources/assets/recipe_icons/check.png";
// 		imgCk.style.display="";
// 		box.appendChild(newP);
// 		document.getElementById("idtxt").innerHTML="아이디를 입력하세요.";
// 		return false;
// 	}else{
// 	xhttp.open("GET", "/user/idcheck?id="+idVal);
// 	xhttp.send();
// 	}
	var pwd1 = document.getElementById("pwdck1").value;
	var pwd2 = document.getElementById("pwdck2").value;
	var imgCk = document.getElementById("pwck");
	var box = document.getElementById("pwdckall");
	var newP2 = document.createElement('span');
	if(document.getElementById("idtxt")){
		document.getElementById("idtxt").remove();
		}
	newP2.setAttribute("id","pwdtxt");
	if(pwd1.length < 8 ) {
		alert('비밀번호는 8글자 이상이여야 합니다.');
		imgCk.src="../../resources/assets/recipe_icons/close.png";
		imgCk.style.display="";
		box.appendChild(newP2);
		document.getElementById("pwdtxt").innerHTML ="비밀번호는 8글자 이상이여야 합니다.";
		return false;
	} else if( pwd1 != pwd2 ) {
		alert("비밀번호가 서로 다릅니다");
		imgCk.src="../../resources/assets/recipe_icons/close.png";
		imgCk.style.display="";
		box.appendChild(newP2);
		document.getElementById("pwdtxt").innerHTML ="비밀번호가 서로 다릅니다.";
		return false;
	} else {
		return true;
	}
}
 </script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <link href="../resources/css/join.css" rel="stylesheet" />
</head>
<body>
<div class="logo">
<img id="mainlogo" class="mainlogo" src="../resources/assets/main-logo.svg" alt="로딩오류" width="400" height="300">
</div>
<div class="joinform">
<form onsubmit="return Validation()" action="/user/join" method="post">
<!-- <form onsubmit="return Validation()"> -->
<div class="info">
<div class="idckall" id="idckall">
아이디 입력</br>
<input type="text" name="id" id="id" class="inputinfo" required>
<img id="idck" class="ckicon" width="10" height="10" style="display:none">
</div>
<input type="button" class="btnck" value="중복확인" onclick="check()"><br/>
<div class="pwdckall" id="pwdckall">
비밀번호 입력<br/><input type="password" name="pwd" id="pwdck1" class="inputinfo" required><br/>
비밀번호 재확인<br/><input type="password" name="pwd2" id="pwdck2" class="inputinfo" required><img id="pwck" class="ckicon" width="10" height="10" style="display:none">
<!-- <input type="button" value="비밀번호 확인" onclick="Validation()"><br/> -->
</div>
이메일 입력<br/><input type="email" name="email"class="inputinfo" required><br/>
<input type="submit" class="btnJoin" value="회원가입" >
<input type="reset" class="btnReset" value="초기화" >
</div>
</form>
</div>

 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html> 


