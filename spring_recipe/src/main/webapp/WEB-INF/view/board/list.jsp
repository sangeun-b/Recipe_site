<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>������ ���</h3>
<a href="/board/write">���ۼ�</a>
<table border="1">
<tr><th>����</th><th>����</th><th>cate</th><th>���̵�</th><th>�ۼ���</th><th>�ۼ���</th></tr>
<c:forEach var="b" items="${list }">
<tr><td><img src="/board/readimg/${b.img_path }" width="100" height="100"></td>
<td>${b.title }</td>
<td>${b.cate }</td>
<td>${b.difficulty }</td>
<td>${b.writer.id }</td>
<td>${b.date }</td></tr>
<tr><th>���</th><td><input type="text" id="com_${b.num }">
<input type="button" value="�ۼ��Ϸ�" onclick="b(${b.num }, '${b.writer.id }')"><br/>
<div id="coms_${b.num }"></div>
</td></tr>
</c:forEach>
</table>
</body>
</html>