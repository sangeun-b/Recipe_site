<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
const del = () => {
	//자바스크립트 페이지 이동
	location.href = "/board/del/${b.num }";
}
</script>
</head>
<body>
<c:if test="${sessionScope.loginid != b.writer.id }">
<c:set var="mode">readonly</c:set>
</c:if>
<h3>레시피 상세 페이지</h3>
<form action="/board/edit" method="post">
<table border="1">
<tr><th>이미지</th><td><img src="/board/readimg/${b.img_path }" width="200" height="200"></td></tr>
<tr><th>제목</th><td>${b.title }</td></tr>
<tr><th>작성자</th><td>${b.writer.id }</td></tr>
<tr><th>cate</th><td>${b.cate }</td></tr>
<tr><th>난이도</th><td>${b.difficulty }</td></tr>
<tr><th>내용</th><td><textarea rows="10" cols="45" name="content" ${mode }>${b.content }</textarea></td></tr>
<tr><th>업로드 날짜</th><td>${b.date }</td></tr>
<c:if test="${sessionScope.loginid == b.writer.id }">
<tr><th>변경</th><td><input type="submit" value="수정"><input type="button" value="삭제" onclick="del()">
<tr><th>댓글</th><td><input type="text" id="com_${b.num }">
<input type="button" value="작성완료" onclick="b(${b.num }, '${b.writer.id }')"><br/>
<div id="coms_${b.num }"></div>
</td></tr>
</c:if>
</table>
</form>
</body>
</html>
>>>>>>> branch 'main' of https://github.com/sangeun-b/Recipe_site.git
