<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<script> 
const add_textbox =()=>{
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML ="<textarea rows='10' cols='45' name='content' id='content'></textarea><input type='file' name='file'><input type='button' value='삭제' onclick='remove(this)'>";
	box.appendChild(newP);
	
}
const remove =(obj)=>{
	document.getElementById('box').removeChild(obj.parentNode);
}

</script>
</head>
<style>
.write-form{
	width:300px; 
	height:36px; 
	border-radius:3px; 
	line-height:36px
	color:black; 
	display: block;
	margin-left: auto;
	margin-right: auto;
	}
	.a{font-size:15px; font-family:Arial;}
	
	img { display: block; margin: 0px auto; }
</style>
<body>

<img class="main-logo" 
	src="../resources/assets/main-logo.svg"
	alt="로딩오류"><br/>
	
		<div class="write-form">
<form action="/board/write" method="post" enctype="multipart/form-data">
		<div class="main-container">
			<section class="writer-main">
				<div class="id-write">
					<span class="a">작성자</span><input type="text" name="writer" value="${sessionScope.loginid }" readonly>
				</div>
				<div class="title-write">
					<span>제목</span><input type="text" name="title">
				</div>
				<div class="difficulty-write">
					<span class="b">난이도</span> 
						<input type="radio" id="diff1" name="difficulty" value="★☆☆☆☆">★☆☆☆☆ 
						<input type="radio" id="diff2" name="difficulty" value="★★☆☆☆">★★☆☆☆ 
						<input type="radio" id="diff3" name="difficulty" value="★★★☆☆">★★★☆☆
						<input type="radio" id="diff4" name="difficulty" value="★★★★☆">★★★★☆
						<input type="radio" id="diff5" name="difficulty" value="★★★★★">★★★★★
				</div>
				<div class="cate-write">
					<span class="c">카테고리</span>
						<input type="radio" id="cate1" name="cate" value="한식">한식
						<input type="radio" id="cate2" name="cate" value="양식">양식 
						<input type="radio" id="cate3" name="cate" value="일식">일식 
						<input type="radio" id="cate4" name="cate" value="중식">중식 
						<input type="radio" id="cate5" name="cate" value="기타">기타
				</div>
				<div class="img-write">
					<span class="d">대표이미지</span>
					<input type="file" name=file>
				</div>
				<div class="ingredient-write">
					<span class="e">재료</span>
					<textarea rows="5" cols="45" name="ingredient" id="ingredient"></textarea>
				</div>
				<div class="content-write">
					<span class="f">레시피 내용</span>
					<textarea rows="10" cols="45" name="content" id="content"></textarea>
				</div>
				<div id="box">
					<input type="button" value="추가" onclick="add_textbox()">
				</div>
				<div class="submit-write">
					<input type="submit" value="작성">
				</div>
				<div class="reset-write">
					<input type="reset" value="초기화">
				</div>
			</section>
			</div>			
		</div>
	</form>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>