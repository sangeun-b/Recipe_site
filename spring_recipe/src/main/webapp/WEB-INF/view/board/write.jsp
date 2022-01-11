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
	href="../resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../resources/css/styles.css" rel="stylesheet" />
<script> 
const add_textbox =()=>{
	const box = document.getElementById("box");
	const newP = document.createElement('p');
	newP.innerHTML ="<textarea rows='10' cols='45' name='content' id='content'></textarea><br/><input type='file' name='file'><input type='button' value='삭제' onclick='remove(this)'>";
	box.appendChild(newP);
	
}
const remove =(obj)=>{
	document.getElementById('box').removeChild(obj.parentNode);
}

</script>
</head>
<body>
<<<<<<< HEAD
<h3>글 작성</h3>
<form action="/board/write" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginid }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title" ></td></tr>
<tr><th>내용</th><td><textarea rows="10" cols="45" name="content"></textarea></td></tr>
<tr><th>이미지</th><td><input type="file" name="file"></td></tr>
=======
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git

<<<<<<< HEAD
<div id=container>
<div id=writer>
작성자 <input type="text" name="writer" value="${sessionScope.loginid }" readonly><br/>
난이도
<input type="radio" id="diff1" name="difficulty" value="매우 쉬움">매우 쉬움
<input type="radio" id="diff2" name="difficulty" value="쉬움">쉬움
<input type="radio" id="diff3" name="difficulty" value="보통">보통
<input type="radio" id="diff4" name="difficulty" value="어려움">어려움<br/>
<input type="radio" id="diff5" name="difficulty" value="매우 어려움">매우 어려움<br/>
카테고리
<input type="radio" id="cate1" name="cate" value="한식">한식
<input type="radio" id="cate2" name="cate" value="양식">양식
<input type="radio" id="cate3" name="cate" value="일식">일식
<input type="radio" id="cate4" name="cate" value="중식">중식
<input type="radio" id="cate5" name="cate" value="기타">기타<br/>


<tr><th>difficulty</th><td>
<input type="radio" id="diff1" name="difficulty" value="★★★">★★★
<input type="radio" id="diff2" name="difficulty" value="보통">보통
<input type="radio" id="diff3" name="difficulty" value="어려움">어려움</td></tr>

<tr><th>cate</th><td>
<input type="radio" id="cate1" name="cate" value="한식">한식
<input type="radio" id="cate2" name="cate" value="양식">양식
<input type="radio" id="cate3" name="cate" value="일식">일식
<input type="radio" id="cate4" name="cate" value="중식">중식
<input type="radio" id="cate5" name="cate" value="기타">기타</td></tr>

<tr><td colspan="2"><input type="submit" value="작성"><input type="reset" value="초기화"></td></tr>
</table>

대표 이미지
<input type="file" name=file>

재료 
<input type="text" name="title" ><br/>
<textarea rows="10" cols="45" name="content" id="content"></textarea><br/>

레시피
<input type="file" name="file"><br/>
<div id=box>
<input type="button" value="이미지 추가" onclick="add_textbox()"><br/>
</div>
<input type="submit" value="글쓰기"><input type="reset" value="초기화">
</div>
</div>

</form>
<!-- <form action="/board/write" method="post" enctype="multipart/form-data"> -->
<!-- <table border="1"> -->
<%-- <tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginid }" readonly></td></tr> --%>
<!-- <tr><th>제목</th><td><input type="text" name="title" ></td></tr> -->
<!-- <tr><th>내용</th><td><textarea rows="10" cols="45" name="content" id="content"></textarea><input type="button" value="add" onclick="add_textbox()"></td></tr> -->
<!-- <tr><th>이미지</th><td><input type="file" name="file"></td></tr> -->
<!-- <tr id="box"> -->
<!-- <!-- <input type="text"><input type="button" value="add" onclick="add_textbox()"> --> -->
<!-- </tr> -->

<!-- <tr><th>difficulty</th><td> -->
<!-- <input type="radio" id="diff1" name="difficulty" value="쉬움">쉬움 -->
<!-- <input type="radio" id="diff2" name="difficulty" value="보통">보통 -->
<!-- <input type="radio" id="diff3" name="difficulty" value="어려움">어려움</td></tr> -->

<!-- <tr><th>cate</th><td> -->
<!-- <input type="radio" id="cate1" name="cate" value="한식">한식 -->
<!-- <input type="radio" id="cate2" name="cate" value="양식">양식 -->
<!-- <input type="radio" id="cate3" name="cate" value="일식">일식 -->
<!-- <input type="radio" id="cate4" name="cate" value="중식">중식 -->
<!-- <input type="radio" id="cate5" name="cate" value="기타">기타</td></tr> -->

<!-- <tr><td colspan="2"><input type="submit" value="작성"><input type="reset" value="초기화"></td></tr> -->
<!-- </table> -->
<!-- </form> -->

=======
	<form action="/board/write" method="post" enctype="multipart/form-data">
		<div class="main-container">
			<section class="writer-main">
				<div class="id-write">
					<span>작성자</span><input type="text" name="writer" value="${sessionScope.loginid }" readonly>
				</div>
				<div class="title-write">
					<span>제목</span><input type="text" name="title">
				</div>
				<div class="difficulty-write">
					<span>난이도</span> 
						<input type="radio" id="diff1" name="difficulty" value="★☆☆☆☆">★☆☆☆☆ 
						<input type="radio" id="diff2" name="difficulty" value="★★☆☆☆">★★☆☆☆ 
						<input type="radio" id="diff3" name="difficulty" value="★★★☆☆">★★★☆☆
						<input type="radio" id="diff4" name="difficulty" value="★★★★☆">★★★★☆
						<input type="radio" id="diff5" name="difficulty" value="★★★★★">★★★★★
				</div>
				<div class="cate-write">
					<span>카테고리</span>
						<input type="radio" id="cate1" name="cate" value="한식">한식
						<input type="radio" id="cate2" name="cate" value="양식">양식 
						<input type="radio" id="cate3" name="cate" value="일식">일식 
						<input type="radio" id="cate4" name="cate" value="중식">중식 
						<input type="radio" id="cate5" name="cate" value="기타">기타
				</div>
				<div class="img-write">
					<span>대표이미지</span>
					<input type="file" name=file>
				</div>
				<div class="ingredient-write">
					<span>재료</span>
					<textarea rows="5" cols="45" name="ingredient" id="ingredient"></textarea>
				</div>
				<div class="content-write">
					<span>레시피 내용</span>
					<textarea rows="10" cols="45" name="content" id="content"></textarea>
				</div>
				<div id="box">
					<input type="button" value="add" onclick="add_textbox()">
				</div>
				<div class="submit-write">
					<input type="submit" value="작성">
				</div>
				<div class="reset-write">
					<input type="reset" value="초기화">
				</div>
			</section>
			
			
		</div>
	</form>
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>

</body>
</html>