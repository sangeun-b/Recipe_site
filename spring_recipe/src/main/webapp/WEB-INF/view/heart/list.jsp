<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 <link rel ="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript">
//만약 flag가 true면 fill heart, flag가 false면 빈 heart
//하트 클릭해서 DB에 저장되면 빈 하트 -> 채워진 하트

// document.addEventListener('DOMContentLoaded', function() {
 	
	
// }, false);

const heartcheck =(num)=>{
	var imgHeart = document.getElementById('img2_'+num);
	alert(num);
	if(imgHeart.src.match("heart_fill")){
		imgHeart.src = "../resources/assets/recipe_icons/heart.png";
		location.href="/heart/likeheartlist/"+num;
	}else{
		imgHeart.src = "../resources/assets/recipe_icons/heart_fill.png";
		location.href="/heart/likeheartlist/"+num;
// 		xhttp.open("GET", "/heart/likeheart");
// 		xhttp.send();
	}

}

</script>
</head>
<body>
<c:if test="${empty list }">
You don't have any like!
</c:if>
<c:if test="${not empty list }">
<c:forEach var="h" items="${list }">
		<div style="border: 1px solid; float: left; width: 33%;">
			<a href="/board/detail/${h.board.num}">
			<img src="/board/readimg/${h.board.img_path/$h.board.num}" width="100" height="100"></a><br />
			<a href="/board/detail/${h.board.num }">${h.board.title }</a>
			<img id="img2_${h.board.num}" onclick="heartcheck(${h.board.num})" src="../resources/assets/recipe_icons/heart_fill.png" style="width:20px; height:20px;" ><br />
			<input type="hidden" id="boardNum" name = "boardNum" value="${h.board.num}">
			<input type="hidden" id="userId" name = "userId" value="${h.user.id}">
		</div>
	</c:forEach>
	</c:if>

	
	
<%-- <!-- 회원으로 로그인 중일 때만 찜 기능 가능.  --> --%>
	
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/scripts.js"></script>
</html>