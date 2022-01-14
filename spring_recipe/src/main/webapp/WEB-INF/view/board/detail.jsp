<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
window.onload = function(){
	if(${flag}==true){
		var imgHeart2 = document.getElementById('img2');
			imgHeart2.src = "../../resources/assets/recipe_icons/heart_fill.png";
	}else{
		imgHeart2.src = "../../resources/assets/recipe_icons/heart.png";
	}
	
}

const com = (num, writer) =>{
const content = document.getElementById("com_"+num).value;
location.href="/com/write/${b.num}/"+content;

}
const del = (num) => {
	let flag = confirm("삭제하시겠습니까?");
	if(flag){
	//자바스크립트 페이지 이동
	location.href = "/board/del/${b.num }";
}	
}

const heartcheck =(num)=>{
	var imgHeart = document.getElementById('img2');
	if(imgHeart.src.match("heart_fill")){
		console.log(num);
		alert(num);
		alert(${b.num})
		imgHeart.src = "../../resources/assets/recipe_icons/heart.png";
 		location.href="/heart/likeheart/${b.num}";
	}else{
		imgHeart.src = "../../resources/assets/recipe_icons/heart_fill.png";
 		location.href="/heart/likeheart/${b.num}";
	}
}
const delCom =(bnum,cnum)=>{
	location.href="/com/del/"+bnum+"/"+cnum;
}
const modify= (num) => {

    let flag = confirm("수정하시겠습니까?");

    if(flag){

    location.href="/board/modify/${b.num}";    

    }

}  
</script>
<link rel="icon" type="image/x-icon"
	href="../../resources/assets/main-logo.svg" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="../../resources/css/styles.css" rel="stylesheet" />
<link href="../../resources/css/detail.css" rel="stylesheet" />
</head>
<body>
	<c:if test="${sessionScope.loginid != b.writer.id }">
		<c:set var="mode">readonly</c:set>
	</c:if>

	<input type="hidden" name="num" id="num" value="${b.num }">
	<c:if test="${sessionScope.loginid != null}">
		<img alt="하트" id="img2" onclick="heartcheck(${b.num})"
			src="../../resources/assets/recipe_icons/heart.png"
			style="width: 20px; height: 20px;">
		<br />
	</c:if>


	<form action="/board/edit" method="post">

        <div  class="imaframe">
		<img class="main-image" src="/board/readimg/${b.img_path}/${b.num}"
			srcset="/board/readimg/${b.img_path }/${b.num} 2x,
             /board/readimg/${b.img_path }/${b.num} 3x">
		</div>
		<div class="title">${b.title }</div>
		
		
		<div class="textarea">
			<div class ="info">
				<div class="cate">카테고리</div>
				<div class="diff">난이도</div>
				<div class="writer">작성자</div>
				<div class="date">작성일</div>	
			</div>
			<div class="content">
				<div class="cate1">${b.cate }</div>
				<div class="diff1">${b.difficulty }</div>
				<div class="writer1">${b.writer.id }</div>
				<div class="date1">${b.date }</div>
			</div>
		</div>
		
		<table border="1" class="ingredient_con">
			<tr>
				<th>재료</th>
				<td><textarea rows="10" cols="45" name="ingredient" ${mode }>${b.ingredient }</textarea>
				</td>
			</tr>
		</table>

		<c:forEach var="r" items="${strList }" varStatus="status">
			<table border="1" class="content_img">
				<tr>
					<td>
						<%--<img src="${contentimg[status.index] }"> --%> <img
						src="/board/readimg/${contentimg[status.index] }/${b.num}"
						width="200" height="200"> <%-- 					<input type="image" src="${contentimg[status.index] }"> --%>
					</td>
				</tr>
				<tr>
					<th>레시피</th>
					<td><textarea rows="10" cols="45" name="content" ${mode }>${r }</textarea>
					</td>
				</tr>
				</c:forEach>


				<%--<c:if test="${sessionScope.loginid == b.writer.id }"> --%>

				<tr>
					<th>변경</th>
					<td><c:if test="${b.writer.id==sessionScope.loginid}">
							<input type="submit" value="수정" onclick="modify()">
							<input type="button" value="삭제" onclick="del()">
						</c:if></td>
				</tr>
				<tr>
					<th>댓글</th>
					<td><input type="text" id="com_${b.num }"> <input
						type="button" value="작성완료"
						onclick="com(${b.num }, '${b.writer.id }')"><br /> <input
						type="submit" value="Done" name="content"></td>
				</tr>

				<%-- 			</c:if> --%>
				<tr>
					<th>댓글목록</th>
					<td><div id="coms_${b.num }">
							<c:if test="${empty c }">
							</c:if>
							<c:if test="${not empty c }">
								<c:forEach var="c" items="${c }">
									<div id="com_${c.num }">
										<c:choose>
											<c:when test="${c.writer.id==sessionScope.loginid}">
												<input type="text" id="comment" value="${c.content }">
											</c:when>
											<c:otherwise>
												<input type="text" id="comment" value="${c.content }"
													readonly>
											</c:otherwise>
										</c:choose>
										<input type="text" id="writer" value="${c.writer.id }"
											readonly>
										<c:if test="${c.writer.id==sessionScope.loginid}">
											<input type="button" id="coms_${b.num }_btn" value="삭제"
												onclick="delCom(${b.num},${c.num })">

										</c:if>
									</div>
								</c:forEach>
							</c:if>
						</div></td>
				</tr>
			</table>
	</form>
	<!-- 			<img src="https://health.chosun.com/site/data/img_dir/2021/01/27/2021012702508_0.jpg" alt="dimg" /> -->
	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/scripts.js"></script>
</body>

</html>
