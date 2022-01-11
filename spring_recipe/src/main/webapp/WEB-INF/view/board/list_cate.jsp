<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon"
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />

</head>
<body>
	<form action="/board/getbytitle" method="post">
		<div id="search" class="search">
			<div id="search_text" class="search_text">
				<input type="text" name="word" placeholder="검색어를 입력하시오">
			</div>
			<div id="search_button" class="search_button">
				<input type="image"
					src="data:image/png;base64,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"
					width="20" height="20">
				<!-- 				<button type="submit">검색</button> -->
			</div>
		</div>
	</form>
	<a href="/board/write" id="boardwrite">글작성</a>
	<div id="cate" class="cate">
		<div id="cate_ko" class="cate_ko">
			<h5>한식</h5>
			<a href="/board/getbycate/한식"><img
				src="https://health.chosun.com/site/data/img_dir/2021/01/27/2021012702508_0.jpg"
				width="300" height="200" /></a>
		</div>
		<div id="cate_ch" class="cate_ch">
			<h5>중식</h5>
			<a href="/board/getbycate/중식"><img
				src="https://ww.namu.la/s/d4c53737b61fec8cf0fa02206d85a5022fc5465593f2e0190648f7c5911acd836a5f7a1db0f19f0136ec1c178d782465a9455b31d178b79df5133fc6b493a41f6acde683b0a01c418bd30dfe56c67705"
				width="300" height="200" /></a>
		</div>
		<div id="cate_ja" class="cate_ja">
			<h5>일식</h5>
			<a href="/board/getbycate/일식"><img
				src="https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000370/img/basic/a0000370_main.jpg?20201002142956&q=80&rw=750&rh=536"
				width="300" height="200" /></a>
		</div>
		<div id="cate_we" class="cate_we">
			<h5>양식</h5>
			<a href="/board/getbycate/양식"><img
				src="https://images.chosun.com/resizer/wsSVlD2KlkIAXTYSWUZxQSceAUE=/960x504/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/HS2MWHN32OMYMSDYNGYRIZCXNI.jpg"
				width="300" height="200" /></a>
		</div>
		<div id="cate_no" class="cate_no">
			<h5>기타</h5>
			<a href="/board/getbycate/기타"> <img
				src="https://www.logoyogo.com/web/wp-content/uploads/edd/2021/02/logoyogo-1-291.jpg "
				width="300" height="200" /></a>
		</div>
	</div>
<!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="../resources/js/scripts.js"></script>
</body>
</html>