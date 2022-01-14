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

<link rel ="icon" type="image/x-icon"
	href="../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<link href="../resources/css/write.css" type="text/css" rel="stylesheet" >

<script> 
const add_textbox =()=>{
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML ="<textarea rows='10' cols='50' name='content' id='content'></textarea><input type='file' name='file' multiple><input type='button' value='삭제' onclick='remove(this)'>";
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
				<img class="main-logo" src="../resources/assets/main-logo.svg"alt="로딩오류">
				<div class="id-write">
					<div><span>작성자</span></div>
					<div class=writer-box>
					<input type="text" name="writer" class="input_text "value="${sessionScope.loginid }" readonly>
					</div>		
				</div>
				<div class="title-write">
					<div><span>제목</span></div>
					<input type="text" name="title" class="input_text ">					
				</div>
				<div class="difficulty-write">
					<div><span>난이도</span></div> 
						<input type="radio" id="diff1" name="difficulty" value="★☆☆☆☆">★☆☆☆☆ 
						<input type="radio" id="diff2" name="difficulty" value="★★☆☆☆">★★☆☆☆ 
						<input type="radio" id="diff3" name="difficulty" value="★★★☆☆">★★★☆☆
						<input type="radio" id="diff4" name="difficulty" value="★★★★☆">★★★★☆
						<input type="radio" id="diff5" name="difficulty" value="★★★★★">★★★★★
				</div>
				<div class="cate-write">
					<div><span>카테고리</span></div>
						<input type="radio" id="cate1" name="cate" value="한식">한식
						<input type="radio" id="cate2" name="cate" value="양식">양식 
						<input type="radio" id="cate3" name="cate" value="일식">일식 
						<input type="radio" id="cate4" name="cate" value="중식">중식 
						<input type="radio" id="cate5" name="cate" value="기타">기타
				</div>
				<div class="ingredient-write">
					<div><span>재료</span></div>
					<textarea name="ingredient" id="ingredient" class="input_text-ingredient"></textarea>
				</div>
				<div class="content-write">
					<div><span>레시피 내용</span></div>
					<textarea name="content" id="content" class="input_text-content"></textarea>
				</div>
				<div class="img-write">
					<span>레시피 사진 등록</span>
					<input type="file" name=file multiple><br/>
				</div>
				<div id="box">
					<input type="button" value="레시피 추가" onclick="add_textbox()" class="btn1">
				</div>
				<div class="img-write">
					<span>대표 이미지를 등록해주세요</span>
					<input type="file" name=file multiple></br>
				</div>	
					<input type="submit" value="작성" class="btn">		
					<input type="reset" value="초기화" class="btn">			
			</section>
			</div>
			
			
			
		
	</form>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>