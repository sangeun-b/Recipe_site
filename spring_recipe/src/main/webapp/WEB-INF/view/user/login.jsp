<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon --> 
        <link rel="icon" type="image/x-icon" href="../resources/assets/favicon.ico" />
        <link href="../resources/css/styles.css" rel="stylesheet" />
</head>
<body>
<form action="/user/login" method="post">
ID:<input type="text" name="id"><br/>
PASSWORD:<input type="password" name="pwd"><br/>
<input type="submit" value="Login">
<a href="/user/join"><input type="button" name="btnJoin" value="Join"></a>
</form>
 <!-- Bootstrap core JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
       
        <script src="../resources/js/scripts.js"></script>
</body>
</html>