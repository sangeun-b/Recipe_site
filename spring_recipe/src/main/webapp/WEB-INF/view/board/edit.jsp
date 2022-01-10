<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title></title>
</head>
<script type="text/javascript">
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/board/list";
		})
	})
</script>
<body>
	<h3>글 작성</h3>



	<section id="container">
		<form name="updateForm" role="form" method="post" action="/board/edit">
		
			<label for="title">제목</label><input type="text" id="title"
				name="title" value="${update.title}" /> <label for="cate">cate</label><input
				type="radio" id="cate1" name="cate" value="한식">한식 <input
				type="radio" id="cate2" name="cate" value="양식">양식 <input
				type="radio" id="cate3" name="cate" value="일식">일식 <input
				type="radio" id="cate4" name="cate" value="중식">중식 <input
				type="radio" id="cate5" name="cate" value="기타">기타<br> <label
				for="difficulty">difficulty</label><input type="radio" id="diff1"
				name="difficulty" value="쉬움">쉬움 <input type="radio"
				id="diff2" name="difficulty" value="보통">보통 <input
				type="radio" id="diff3" name="difficulty" value="어려움">어려움<br>

			<label for="content">내용</label>
			<textarea id="content" name="content"><c:out
					value="${update.content}" /></textarea>
			<label for="writer">작성자</label><input type="text" id="writer"
				name="writer" value="${update.writer}" readonly="readonly" /> <label
				for="regdate">작성날짜</label>
			<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd" />



			<div>
				<button type="submit" class="update_btn">저장</button>
				<button type="submit" class="cancel_btn">취소</button>
			</div>
		</form>
	</section>

</body>
</html>