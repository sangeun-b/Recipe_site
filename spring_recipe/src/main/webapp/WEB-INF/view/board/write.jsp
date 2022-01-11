<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />       
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
<body>
<h3>글 작성</h3>
<form action="/board/write" method="post" enctype="multipart/form-data">

<table border="1">
<tr><th>제목</th><td><input type="text" name="title" ></td></tr>
<tr><th>내용</th><td><textarea rows="10" cols="45" name="content"></textarea></td></tr>
<tr><th>이미지</th><td><input type="file" name="file"></td></tr>

<div id=container>
<div id=writer>
작성자 <input type="text" name="writer" value="${sessionScope.loginid }" readonly><br/>

<tr><th>난이도</th><td>
<input type="radio" id="diff1" name="difficulty" value="매우 쉬움">매우 쉬움
<input type="radio" id="diff2" name="난이도" value="쉬움">쉬움
<input type="radio" id="diff3" name="난이도" value="보통">보통
<input type="radio" id="diff4" name="난이도" value="어려움">어려움<br/>
<input type="radio" id="diff5" name="난이도" value="매우 어려움">매우 어려움<br/></td></tr>

<tr><th>카테고리</th><td>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</body>
</html>