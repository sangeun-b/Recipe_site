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
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script>
//만약 flag가 true면 fill heart, flag가 false면 빈 heart
//하트 클릭해서 DB에 저장되면 빈 하트 -> 채워진 하트
//1. click -> show & hide?
//2. click -> class name 변경해서 css로 변경
// $(document).ready(function(){
   

//     /*img1을 클릭했을 때 img2를 보여줌*/
//     $("#img1").click(function(){
//         $("#img1").hide();
//         $("#img2").show();
//     });

//     /*img2를 클릭했을 때 img1을 보여줌*/
//     $("#img2").click(function(){
//         $("#img1").show();
//         $("#img2").hide();
//     });
// });
document.addEventListener('DOMContentLoaded', function() {
 	
	var checked = 0;
	if(${sessionScope.loginid}!=null){
		
	}
}, false);

</script>
</head>
<body>

	<c:forEach var="b" items="${list }">
		<div style="border: 1px solid; float: left; width: 33%;">
			<a href="/board/detail/${b.num }"><img
				src="/board/readimg/${b.img_path }" width="100" height="100"></a><br />
			<a href="/board/detail/${b.num }">${b.title }</a><br />
			<img id="img1" src="../resources/assets/recipe_icons/heart.png" style="width:40px; height:40px;">
			<img id="img2" src="../resources/assets/recipe_icons/heart_fill.png" style="width:40px; height:40px; display:none"><br />
		</div>
	</c:forEach>
	
	<c:if test = "${user==null }">
	<img id="img1" src="../resources/assets/recipe_icons/heart.png" style="width:40px; height:40px;">
	<img id="img2" src="../resources/assets/recipe_icons/heart_fill.png" style="width:40px; height:40px; display:none"><br />
	</c:if>
	
<%-- <!-- 회원으로 로그인 중일 때만 찜 기능 가능.  --> --%>
	
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/scripts.js"></script>
</html>