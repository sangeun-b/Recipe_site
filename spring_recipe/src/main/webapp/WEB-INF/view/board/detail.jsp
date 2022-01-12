<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// window.onload = function(){
// 	if(${flag}==true){
// 		var imgHeart2 = document.getElementById('img2');
// 			imgHeart2.src = "../../resources/assets/recipe_icons/heart_fill.png";
// 	}else{
// 		imgHeart2.src = "../../resources/assets/recipe_icons/heart.png";
// 	}
// 	if(${c} != null ){
// 		let arr = ${c};
// 		let txt = "";
// 		for(let i=0; i<arr.length; i++){
// 			txt+=arr[i].content+"("+arr[i].writer.id+")<br/>";
// 			num=arr[0].board.num;
// 			document.getElementById("coms_"+num).innerHTML = txt;
// 		}
// 	}
}
const xhttp = new XMLHttpRequest();//비동기 요청 객체
//응답이 왔을때 자동 호출 //{flag:true}
xhttp.onload = function() {
	if(xhttp.readyState==4){//요청이 잘 갔는지 확인
		if(xhttp.status==200){//응답 결과 코드 . 500:논리적오류. 404:경로문제, 400:서버요구값이 전달안됐을때
			//let members = eval("("+xhttp.responseText+")");
			alert(xhttp.responseText);
			let obj = JSON.parse(xhttp.responseText);//배열{"flag":true} json 형태로 parse
			let arr = obj.reps;
			let txt = "";
			for(let i=0; i<arr.length; i++){
				txt+=arr[i].content+"("+arr[i].writer.id+")<br/>";
				num=arr[0].board.num;
				document.getElementById("coms_"+num).innerHTML = txt;
			}
// 			for(let i=0; i<arr.length; i++){
// 				const box = document.getElementById("coms_"+${b.num });
// 				txt+=arr[i].content+"("+arr[i].writer.id+")";
//  				num=arr[0].board.num;
// 				const newP = document.createElement('p');
// 				newP.innerHTML="<input type='text' name='comment' id='comment' value='txt'><input type='button' name='delBtn' value='삭제'>";
// 				box.appendChild(newP);
// 				if(${b.writer.id==sessionScope.loginid}){
// 					const box = document.getElementById("coms_"+${b.num });
// 					const newP2 = document.createElement('p');
// 					newP2.innterHTML = "<input type='button' name='delBtn' value='삭제' onclick='delCom(${b.num})'>";
// 					box.appendChild(newP2);
// 				}
// 			}		
			
		}else{
			alert("응답 error code:"+xhttp.status);
		}
	}else{
		alert("요청 error code:"+xhttp.readyState);
	}

}
	const com = (num, writer) => {	
		const com = document.getElementById("com_"+num).value;
		let param = "board="+num;
		param += "&writer=${sessionScope.loginid}";
		param += "&content="+com;
		alert(param);
		xhttp.open("GET", "/com/write?"+param);//요청 설정
		xhttp.send();//요청 전송. 페이지는 이동하지 않음
		document.getElementById("com_"+num).value ="";
	}

const del = (num) => {
	let flag = confirm("삭제하시겠습니까?");
	if(flag){
	//자바스크립트 페이지 이동
	location.href = "/board/del/${b.num }";
}	
}

const heartcheck =(num)=>{
	var imgHeart = document.getElementById('img2');
	if(imgHeart.src.match("heart_fill")){
		console.log(num);
		alert(num);
		alert(${b.num})
		imgHeart.src = "../../resources/assets/recipe_icons/heart.png";
 		location.href="/heart/likeheart/${b.num}";
	}else{
		imgHeart.src = "../../resources/assets/recipe_icons/heart_fill.png";
 		location.href="/heart/likeheart/${b.num}";
	}

}
</script>
<link rel="icon" type="image/x-icon"
	href="../../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:if test="${sessionScope.loginid != b.writer.id }">
		<c:set var="mode">readonly</c:set>
	</c:if>
	<h3>레시피 상세 페이지</h3>
	<input type ="hidden" name="num" id="num" value="${b.num }">
	<c:if test="${sessionScope.loginid != null}">
	<img id="img2" onclick="heartcheck(${b.num})" src="../../resources/assets/recipe_icons/heart.png" style="width:20px; height:20px;" ><br />
	</c:if>
	<form action="/board/edit" method="post">
		<table border="1">
			<tr>
				<th>이미지</th>
				<td><img src="/board/readimg/${b.img_path }" width="200"
					height="200"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${b.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${b.writer.id }</td>
			</tr>
			<tr>
				<th>cate</th>
				<td>${b.cate }</td>
			</tr>
			<tr>
				<th>난이도</th>
				<td>${b.difficulty }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="45" name="content" ${mode }
						readonly>${b.content }</textarea></td>
			</tr>
			<tr>
				<th>업로드 날짜</th>
				<td>${b.date }</td>
			</tr>
<%-- 			<c:if test="${sessionScope.loginid == b.writer.id }"> --%>
				<tr>
					<th>변경</th>
					<td><c:if test="${b.writer.id==sessionScope.loginid}">
							<input type="submit" value="수정">
							<input type="button" value="삭제" onclick="del()">
						</c:if>
				<tr>
					<th>댓글</th>
					<td><input type="text" id="com_${b.num }"> <input
						type="button" value="작성완료"
						onclick="com(${b.num }, '${b.writer.id }')"><br />
						</td>
				</tr>
<%-- 			</c:if> --%>
			<tr>
			
				<th>댓글목록</th>
<%-- 				<td><input type="text" id="com_${b.num }" readonly> --%>
				<td><div id="coms_${b.num }">
<%-- 				<c:if test="${b.writer.id==sessionScope.loginid}"> --%>
<%-- 				<input type="button" id="coms_${b.num }_btn" value="삭제" onclick=""> --%>
<%-- 				</c:if> --%>
				</div></td>
			</tr>
		</table>
	</form>
	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../../resources/js/scripts.js"></script>
</body>

</html>