<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />

<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/list_style.css" rel="stylesheet" />
</head>
<body>
	<form action="/board/getbytitle" method="post">
		<div id="search" class="search">
			<div id="search_text" class="search_text">
				<input type="text" name="word" class="inputsearch"
					placeholder="음식 이름을 입력하시오" style="width: 300px;">
			</div>
			<div id="search_button" class="search_button">
				<input type="image"
					src="data:image/png;base64,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"
					width="20" height="20">
				<!-- 				<button type="submit">검색</button> -->
			</div>
		</div>
	</form>

	<a href="/board/write" id="boardwrite"><img
		src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReaFZ0VIv31hUzlKKNFY8-1wn_scvovMPrrQ&usqp=CAU"
		width="50" height="50" class="boardwriteimg"></a>

	<div class="listsort" id="show_locale_switch">
		<select name="sort" id="sort" title="정렬" class="sort2">
			<!-- 		<select name="sort" id="sort" title="정렬" class="sort2" onchange="mysort(this.value)"> -->
			<option value="날짜순">날짜순</option>
			<option value="이름순">이름순</option>
			<option value="난이도순">난이도순</option>
			<option value="추천순">추천순</option>
		</select>
	</div>

	
	<div class="listout">
	<c:forEach var="b" items="${list }">
		<div class="listin">
			<a href="/board/detail/${b.num }"><img
				src="/board/readimg/${b.img_path }/${b.num}" class="listimg"
				name="listimg" width="200" height="160"></a><br /> <a
				href="/board/detail/${b.num }">${b.title }</a><br /> 난이도
			<span>${b.difficulty }<br /></span>
		</div>
	</c:forEach>
	</div>




	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../../resources/js/scripts.js"></script>
</body>
</html>
