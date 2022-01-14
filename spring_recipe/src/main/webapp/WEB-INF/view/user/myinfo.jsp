<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
<script>
const ckEdit =()=>{
	if(confirm("수정하시겠습니까?")==true){
		document.editForm.submit();
	}else{
		return false;
	}
}
</script>
</head>
<body>
<h3>my info</h3>
<form name="editForm" action="/user/edit" method="post">
ID:<input type="text" name="id" value="${u.id }" readonly><br/>
PASSWORD:<input type="password" value="${u.pwd }" name="pwd"><br/>
RE-PASSWORD:<input type="password" name="pwd2"><br/>
EMAIL:<input type="email" value="${u.email }" name="email"><br/>
<input type="button" value="edit" onclick="ckEdit();">
</form>
<a href=""><input type="button" value="my list"></a><br/>
<a href="/user/out"><input type="button" value="delete"></a><br/>
</body>
 <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
</html>