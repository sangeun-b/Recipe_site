<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->

<link rel="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />

<script> 
const add_textbox =()=>{
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML ="<textarea rows='10' cols='45' name='content' id='content'></textarea><input type='file' name='file' multiple><input type='button' value='삭제' onclick='remove(this)'>";
	box.appendChild(newP);
}
const remove =(obj)=>{
	document.getElementById('box').removeChild(obj.parentNode);
}

</script>
</head>
<body>
	<form action="/board/modify" method="post"
		enctype="multipart/form-data">
		<div class="main-container">
			<section class="writer-main">
				<div class="id-write">
					<span>작성자</span><input type="text" name="writer"
						value="${sessionScope.loginid }" readonly>
				</div>
				<div class="title-write">
				<input type='hidden' name=num value="${b.num }">		
					<span>제목</span><input type="text" name="title" value=${b.title }>
					
				</div>
				<div class="difficulty-write">
					<span>난이도</span> <input type="radio" id="diff1" name="difficulty"
						value="★☆☆☆☆">★☆☆☆☆ <input type="radio" id="diff2"
						name="difficulty" value="★★☆☆☆">★★☆☆☆ <input type="radio"
						id="diff3" name="difficulty" value="★★★☆☆">★★★☆☆ <input
						type="radio" id="diff4" name="difficulty" value="★★★★☆">★★★★☆
					<input type="radio" id="diff5" name="difficulty" value="★★★★★">★★★★★
				</div>
				<div class="cate-write">
					<span>카테고리</span> <input type="radio" id="cate1" name="cate"
						value="한식">한식 <input type="radio" id="cate2" name="cate"
						value="양식">양식 <input type="radio" id="cate3" name="cate"
						value="일식">일식 <input type="radio" id="cate4" name="cate"
						value="중식">중식 <input type="radio" id="cate5" name="cate"
						value="기타">기타
				</div>
				<div class="img-write">
					<span>현재 대표이미지</span>
					<img src="/board/readimg/${b.img_path}/${b.num}" width="200" height="200">
				</div>
				<div class="ingredient-write">
					<span>재료</span>
					<textarea rows="5" cols="45" name="ingredient" id="ingredient">${b.ingredient }</textarea>
				</div>
			<c:forEach var="r" items="${strList }" varStatus="status">
				<div class="content-write">
					<span>레시피 내용</span>
					<textarea rows="10" cols="45" name="content" id="content">${r }</textarea>
				</div>
				<div class="img-write">
					<span>레시피 사진 등록</span>
					<span> 등록되어있는 파일 : ${contentimg[status.index] }</span>
					<input type="file" name="file" multiple>
					
				</div>
				</c:forEach>
				<div id="box">
					<input type="button" value="add" onclick="add_textbox()">
				</div>
				 <input class="submit-write" type="submit" role="button" value="수정">
				</div>
				<div class="reset-write">
					<input type="reset" value="초기화">
				</div>
			</section>
		</div>
	</form>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
	<script src="../webjars/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>