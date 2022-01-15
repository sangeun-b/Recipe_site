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
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/write.css" type="text/css" rel="stylesheet">

<script> 
const add_textbox =()=>{
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML ="<textarea rows='5' cols='46' name='content' style='margin-top:15px;' id='content'></textarea><input type='file' name='file' style='margin-top:10px;' multiple><input type='button' value='삭제' onclick='remove(this)'>";
	box.appendChild(newP);	
}

const remove =(obj)=>{
	document.getElementById('box').removeChild(obj.parentNode);
}

</script>
</head>
<body>
	<form action="/board/write" method="post" enctype="multipart/form-data">
		<div class="main-container">
			<section class="writer-main">
<!-- 				<img class="main-logo" src="../resources/assets/main-logo.svg" -->
<!-- 					alt="로딩오류"> -->
				<h2>레시피 작성</h2>
				<div class="id-write">
					<div>
						<span class="lititle">작성자</span>
					</div>
					<div class=writer-box>
						<input type="text" name="writer" class="input_text "
							value="${sessionScope.loginid }" readonly>
					</div>
				</div>
				<div class="title-write">
					<div>
						<span class="lititle">제목</span>
					</div>
					<input type="text" name="title" class="input_text ">
				</div>
				<div class="difficulty-write">
					<div>
						<span class="lititle">난이도</span>
					</div>
					<input type="radio"  class="rd" id="diff1" name="difficulty" value="★☆☆☆☆"><span class="dif">★☆☆☆☆</span>
					<input type="radio" class="rd" id="diff2" name="difficulty" value="★★☆☆☆"><span class="dif">★★☆☆☆</span>
					<input type="radio" class="rd" id="diff3" name="difficulty" value="★★★☆☆"><span class="dif">★★★☆☆</span>
					<input type="radio" class="rd" id="diff4" name="difficulty" value="★★★★☆"><span class="dif">★★★★☆</span>
					<input type="radio" class="rd" id="diff5" name="difficulty" value="★★★★★"><span class="dif">★★★★★</span>
				</div>
				<div class="cate-write">
					<div>
						<span class="lititle">카테고리</span>
					</div>
					<input type="radio" class="rad" id="cate1" name="cate" value="한식">한식 <input
						type="radio" class="rad" id="cate2" name="cate" value="양식">양식 <input
						type="radio" class="rad" id="cate3" name="cate" value="일식">일식 <input
						type="radio" class="rad" id="cate4" name="cate" value="중식">중식 <input
						type="radio" class="rad" id="cate5" name="cate" value="기타">기타
				</div>
				<div class="ingredient-write">
					<div>
						<span class="lititle">재료</span>
					</div>
					<textarea name="ingredient" id="ingredient"
						class="input_text-ingredient" style="width:100%"></textarea>
				</div>
				<div class="content-write">
					<div>
						<span class="lititle">레시피 내용</span>
					</div>
					<textarea name="content" id="content" class="input_text-content"></textarea>
				</div>
				<div class="img-write">
					<span class="lititle">레시피 사진 등록</span> <input type="file" name=file multiple><br />
				</div>
				<div id="box"></div>
				<input type="button" value="레시피 추가" onclick="add_textbox()"
					class="btn1">

				<div class="img-write">
					<span class="lititle">대표 이미지를 등록해주세요</span><br/>
					<input type="file" name=file class="input-file" multiple></br>
				</div>
				<input type="submit" value="작성" class="btn"> <input
					type="reset" value="초기화" class="btn">
			</section>
		</div>




	</form>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>