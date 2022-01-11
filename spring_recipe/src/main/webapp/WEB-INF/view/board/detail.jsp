
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
const xhttp = new XMLHttpRequest();
xhttp.onload = function() {
	if(xhttp.readyState==4){//요청이 잘 갔는지 확인
		if(xhttp.status==200){//응답 결과 코드 . 500:논리적오류. 404:경로문제, 400:서버요구값이 전달안됐을때
			//let members = eval("("+xhttp.responseText+")");
			alert(xhttp.responseText);
			let obj = JSON.parse(xhttp.responseText);//배열{"flag":true}
			let arr = obj.coms;
			let txt = "";
			for(let i=0; i<arr.length; i++){
				txt+=arr[i].content+"("+arr[i].writer.id+")<br/>";
			}
			num = arr[0].board.num;
			document.getElementById("coms_"+num).innerHTML = txt;
		}else{
			alert("응답 error code:"+xhttp.status);
		}
	}else{
		alert("요청 error code:"+xhttp.readState);
	}
}
	const b = (num, writer) => {
		const com = document.getElementById("com_"+num).value;
		alert(com);
		let param = "board=" + num;
		param += "&writer=${sessionScope.loginid}";
		param += "&content="+com
		//서버에 보낼 요청을 설정open(전송방식, 서버페이지경로, true/false). 파라메터: url?이름=값&이름=값
		xhttp.open("GET", "/com/write?"+param);//요청 설정
		xhttp.send();
		document.getElementById("com_"+num).value="";
	}
const del = (num) => {
	let flag = confirm("삭제하시겠습니까?");
	if(flag){
	//자바스크립트 페이지 이동
	location.href = "/board/del/"+num;
	//${b.num }";
}	
const edit =	
}

</script>
<link rel="icon" type="image/x-icon"
	href="../../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:if test="${sessionScope.loginid != b.writer.id }">
		<c:set var="mode">readonly</c:set>
	</c:if>
	<h3>레시피 상세 페이지</h3>
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
				<th>재료</th>
				<td>${b.ingredient }</td>
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
			<c:if test="${sessionScope.loginid == b.writer.id }">
				<tr>
					<th>변경</th>
					<td><c:if test="${b.writer.id==sessionScope.loginid}">
							<input type="submit" value="수정" onclick="edit()">
							<input type="button" value="삭제" onclick="del(${b.num})">
						</c:if></td>
				</tr>
				<tr>
					<th>댓글</th>
					<td><input type="text" id="com_${b.num }"> <input
						type="button" value="작성완료"
						onclick="b(${b.num }, '${b.writer.id}')"><br />
						<div id="coms_${b.num }"></div></td>
				</tr>
			</c:if>
			<tr>
				<th>댓글목록</th>
				<td><c:if test="${b.writer.id==sessionScope.loginid}">
						<input type="text" id="com_${b.num }" readonly>
					</c:if></td>


			</tr>
		</table>
	</form>
	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script src="../../resources/js/scripts.js"></script>
</body>
</html>


