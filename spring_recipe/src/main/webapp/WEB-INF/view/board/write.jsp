<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>�� �ۼ�</h3>
<form action="/board/write" method="post" enctype="multipart/form-data">
<table border="1">
<tr><th>�ۼ���</th><td><input type="text" name="writer" value="${sessionScope.loginid }" readonly></td></tr>
<tr><th>����</th><td><input type="text" name="title" ></td></tr>
<tr><th>����</th><td><textarea rows="10" cols="45" name="content"></textarea></td></tr>
<tr><th>�̹���</th><td><input type="file" name="file"></td></tr>

<tr><th>difficulty</th><td>
<input type="radio" id="diff1" name="difficulty" value="����">����
<input type="radio" id="diff2" name="difficulty" value="����">����
<input type="radio" id="diff3" name="difficulty" value="�����">�����</td></tr>

<tr><th>cate</th><td>
<input type="radio" id="cate1" name="cate" value="�ѽ�">�ѽ�
<input type="radio" id="cate2" name="cate" value="���">���
<input type="radio" id="cate3" name="cate" value="�Ͻ�">�Ͻ�
<input type="radio" id="cate4" name="cate" value="�߽�">�߽�
<input type="radio" id="cate5" name="cate" value="��Ÿ">��Ÿ</td></tr>

<tr><td colspan="2"><input type="submit" value="�ۼ�"><input type="reset" value="�ʱ�ȭ"></td></tr>
</table>
</form>

</body>
</html>