<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>레시피 목록</h3>
<a href="/board/write">글작성</a>
<table border="1">
<tr><th>사진</th><th>제목</th><th>cate</th><th>난이도</th><th>작성자</th><th>작성일</th></tr>
<c:forEach var="b" items="${list }">
<tr><td><img src="/board/readimg/${b.img_path }" width="100" height="100"></td>
<td><a href="/board/detail/${b.num }">${b.title }</a></td>
<td>${b.cate }</td>
<td>${b.difficulty }</td>
<td>${b.writer.id }</td>
<td>${b.date }</td></tr>


</c:forEach>
</table>
</body>
</html>