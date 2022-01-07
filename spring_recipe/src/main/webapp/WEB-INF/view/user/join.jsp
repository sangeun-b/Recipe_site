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
				txt = "Available ID";
			}else{
				txt = "Not Available ID";
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

</script>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<form action="/user/join" method="post">
ID: <input type="text" name="id" id="id">
<input type="button" value="Check" onclick="check()">
<div id="res"></div><br/>
PASSWORD: <input type="password" name="pwd"><br/>
RE-PASSWORD : <input type="password" name="pwd2"><br/>
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