<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Cook Recipe Site</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/home.css" rel="stylesheet" />
<script>
	//         window.onload = function(){
	//         	location.href="board/ranboard";

	//         }
</script>
</head>
<body>
	<!-- Page content-->
	<%-- <img class="recommendimg" src="/board/readimg/${b.img_path }/${b.num}" width="100" height="100"> --%>

	<section class="Frame-4">
		<div class="Frame-2">
			<span class="title">오늘의 추천 레시피</span>
		</div>

		<div class="Frame-1">
			<div class="recommending">
				<a href="/board/detail/${b.num }"> <img
					src="/board/readimg/${b.img_path }/${b.num}"
					srcset="/board/readimg/${b.img_path }/${b.num} 2x,
             /board/readimg/${b.img_path }/${b.num} 3x"
					class="recommending"></a><br />
			</div>
		</div>
		<div class="Frame-3">
			<a class="recipename" href="/board/detail/${b.num }"><span class="recipename">${b.title }</span></a>
		</div>
	</section>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>
