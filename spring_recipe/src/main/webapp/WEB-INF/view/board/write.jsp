<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>글 작성</h3>
<form action="/board/write" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>작성자</th><td><input type="text" name="writer" value="${sessionScope.loginid }" readonly></td></tr>
<tr><th>제목</th><td><input type="text" name="title" ></td></tr>
<tr><th>내용</th><td><textarea rows="10" cols="45" name="content"></textarea></td></tr>
<tr><th>이미지</th><td><input type="file" name="file"></td></tr>

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
</form>

</body>
</html>