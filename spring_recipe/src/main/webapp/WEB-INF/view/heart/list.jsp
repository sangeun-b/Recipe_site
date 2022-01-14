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
<link href="../resources/css/like.css" rel="stylesheet" />
<script type="text/javascript">
// document.addEventListener('DOMContentLoaded', function() {
// }, false);
const heartcheck =(num)=>{
	var imgHeart = document.getElementById('img2_'+num);
	if(imgHeart.src.match("heart_fill")){
		imgHeart.src = "../resources/assets/recipe_icons/heart.png";
		location.href="/heart/likeheartlist/"+num;
	}else{
		imgHeart.src = "../resources/assets/recipe_icons/heart_fill.png";
		location.href="/heart/likeheartlist/"+num;
	}
}

</script>
</head>
<body>

<c:if test="${empty list }">
<section class="noheart">
<div class="noheart2">
찜한 게시물이 없습니다.</br>
마음에 드는 레시피의 하트를 눌러 찜해보세요<img class="hearticon" src="../resources/assets/recipe_icons/heart_fill.png" >
</div>
</section>
</c:if>


<c:if test="${not empty list }">
<div class="maintitle">
${sessionScope.loginid } 님의 찜리스트 
<img class="hearticon" src="../resources/assets/recipe_icons/heart_fill.png" >
</div>
<div class="heartall">
<c:forEach var="h" items="${list }">

		<div class="heartlist">
			<a href="/board/detail/${h.board.num}">
<%-- 			<img src="/board/readimg/${h.board.img_path}/${h.board.num}" width="100" height="100"></a><br /> --%>
			<img class="imgs" src="/board/readimg/${h.board.img_path}/${h.board.num}"></a><br />
			<div class="info">
			<a class="title" href="/board/detail/${h.board.num }">${h.board.title }</a>
			<img class="hearticon" id="img2_${h.board.num}" onclick="heartcheck(${h.board.num})" src="../resources/assets/recipe_icons/heart_fill.png" ><br />
			</div>
			<input type="hidden" id="boardNum" name = "boardNum" value="${h.board.num}">
			<input type="hidden" id="userId" name = "userId" value="${h.user.id}">
		</div>

</c:forEach>
	</c:if>	
	</div>
	
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/scripts.js"></script>
</html>