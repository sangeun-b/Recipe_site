<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>my info</h3>
<form action="/user/edit" method="post">
ID:<input type="text" name="id" value="${u.id }" readonly><br/>
PASSWORD:<input type="password" value="${u.pwd }" name="pwd"><br/>
RE-PASSWORD:<input type="password" name="pwd2"><br/>
EMAIL:<input type="email" value="${u.email }" name="email"><br/>
<input type="submit" value="edit">
</form>
<a href=""><input type="button" value="my list"></a><br/>
<a href="/user/out"><input type="button" value="delete"></a><br/>
</body>
</html>