<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[name='readForm']");

		// 수정 
		$(".update_btn").on("click", function() {
			formObj.attr("action", "/board/edit");
			formObj.attr("method", "get");
			formObj.submit();
		})

		// 삭제
		$(".delete_btn").on("click", function() {
			formObj.attr("action", "/board/del/{num}");
			formObj.attr("method", "post");
			formObj.submit();
		})

		// 취소
		$(".list_btn").on("click", function() {

			location.href = "/board/list";
		})
	})
</script>
<body>
	<form action="/board/detail" method="post">
		<table border="1">
			<tr>
				<th>사진</th>
				<th>제목</th>
				<th>cate</th>
				<th>난이도</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="b" items="${list }">

				<tr>

					<td><img src="/board/readimg/${b.img_path }" width="100"
						height="100"></td>
					<td>${b.title}</td>
					<td>${b.cate}</td>
					<td>${b.difficulty}</td>
					<td>${b.writer.id}</td>
					<td>${b.date}</td>
				</tr>



			</c:forEach>

		</table>
		</form>
		<div>
			<button type="submit" class="update_btn">레시피 수정</button>
			<button type="submit" class="delete_btn">레시피 삭제</button>
			<button type="submit" class="list_btn">뒤로가기</button>
		</div>
		<!--레시피리스트하는법 -->
		<!--댓글 -->
		<h3>댓글</h3>
		<table border="1">
			<tr>
				<th>작성자<input type="text" name="writer" value="${b.writer.id }"
					readonly></th>
				<th>작성일자<fmt:formatDate value="${result.regDate}"
						pattern="yyyy-MM-dd HH:mm:ss" /></th>
				<th>수정</th>
				<th>삭제</th>
				<th>댓글내용</th>
			</tr>
		</table>
	
</body>
</html>
