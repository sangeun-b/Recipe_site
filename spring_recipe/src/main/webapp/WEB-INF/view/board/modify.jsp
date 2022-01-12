<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

<script> 

let mForm = $("#modifyForm");    // 페이지 데이터 수정 from

/* 수정 하기 버튼 */
$("#modify_btn").on("click", function(e){
    mForm.submit();
});

/* 취소 버튼 */
$("#cancel_btn").on("click", function(e){
    form.attr("action", "/board/get");
    form.submit();
});    
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
<body>
	<form id="modifyForm" action="board/modify" method="post"
		enctype="multipart/form-data">
		<div class="main-container">
			<section class="writer-main">
				<div class="id-write">
					<span>작성자</span><input type="text" name="writer"
						value="${sessionScope.loginid }" readonly>
				</div>
				<div class="title-write">
					<span>제목</span><input type="text" name="title">
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
					<span>대표이미지</span> <input type="file" name=file>
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

				<div class="reset-write">
					<input type="reset" value="초기화">
				</div>

				<div class="btn_wrap">
					<a class="btn" id="modify_btn">수정 완료</a> <a class="btn"
						id="cancel_btn">수정 취소</a>
				</div>
			</section>
		</div>
	</form>
	<form id="infoForm" action="/board/modify" method="get">
	<input type="hidden" id="board_num" name="board_num" value='<c:out value="${board.num}"/>'>
	</form>
	
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="../resources/js/scripts.js"></script>
</body>
</html>