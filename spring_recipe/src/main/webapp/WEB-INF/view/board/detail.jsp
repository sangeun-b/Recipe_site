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
			imgHeart2.src = "../../resources/assets/recipe_icons/after-zzim.svg";
	}else{
		imgHeart2.src = "../../resources/assets/recipe_icons/before-zzim.svg";
	}
	
}

const com = (num, writer) =>{
const content = document.getElementById("com_"+num).value;
console.log(content);
location.href="/com/write/${b.num}/"+content;

}
const del = (num) => {
	let flag = confirm("레시피를 삭제하시겠습니까?");
	if(flag){
	location.href = "/board/del/${b.num }";
}	
}

const heartcheck =(num)=>{
	var imgHeart = document.getElementById('img2');
	if(imgHeart.src.match("after-zzim.svg")){
		imgHeart.src = "../../resources/assets/recipe_icons/before-zzim.svg";
 		location.href="/heart/likeheart/${b.num}";
	}else{
		imgHeart.src = "../../resources/assets/recipe_icons/after-zzim.svg";
 		location.href="/heart/likeheart/${b.num}";
	}
}

const delCom =(bnum,cnum)=>{
	let flag = confirm("댓글을 삭제하시겠습니까?");
	if(flag){
	location.href="/com/del/"+bnum+"/"+cnum;
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
<span class="space">
	<input type="hidden" name="num" id="num" value="${b.num }">
	<c:if test="${not empty sessionScope.loginid}">
		<img alt="하트" id="img2" onclick="heartcheck(${b.num})"
			src="../../resources/assets/recipe_icons/before-zzim.svg">
		<br />
	</c:if>


	<form action="/board/edit" method="post">
		<img class="main-image" src="/board/readimg/${b.img_path}/${b.num}">

		<span class="title">${b.title }</span>

		<span class="menuframe">
			<span class="cate">카테고리</span>
			<span class="diff">난이도</span>
			<span class="writer">작성자</span>
			<span class="date">작성일</span>
		</span>
		
		<span class="contextframe">
			<span class="cate1">${b.cate }</span>
			<span class="diff1">${b.difficulty }</span>
			<span class="writer1">${b.writer.id }</span>
			<span class="date1">${sdate }</span>
		</span>


			
		<span class="ingredientmenu">재료</span>
		<textarea rows="10" cols="45" name="content" class="ingredientcontent" readonly>${b.ingredient }</textarea>

	<span class="recipeframes">	
				<c:forEach var="r" items="${strList }" varStatus="status">
				
				<textarea class="recipetext"rows="10" cols="45" name="content" readonly>${r }</textarea>
				</c:forEach>
				
				
		</span>

		<span class="recipeimagesframes">
				<c:forEach var="r" items="${strList }" varStatus="status">
						
							<img class="recipeimages"
							src="/board/readimg/${contentimg[status.index] }/${b.num}">
		
				</c:forEach>
				<!-- 댓글부분 -->
				<c:if test="${not empty sessionScope.loginid}">
				<input class="comment" type="text" id="com_${b.num }">
				<input class="comment-button" type="button" value="댓글작성" 
					        onclick="com(${b.num }, '${b.writer.id }')">
				</c:if>
				
					
				<c:if test="${not empty c }">
						<div class=comment-menu></div>
						<c:forEach var="c" items="${c }">
								<%-- <div id="com_${c.num }"> --%>
									<input class="comment-writer" type="text" id="writer" value="${c.writer.id }" readonly>
									<c:if test="${c.writer.id==sessionScope.loginid}">

										<input class="del-comment-button"type="button" id="coms_${b.num }_btn" value="삭제"
											onclick="delCom(${b.num},${c.num })">
									</c:if>
								
									<c:choose>
										<c:when test="${c.writer.id==sessionScope.loginid}">

											<input class="comment-content" type="text" id="comment_${c.board.num }"
												value="${c.content }" readonly>
										</c:when>
										<c:otherwise>
											<input class="comment-content" type="text" id="comment_${c.board.num }"
												value="${c.content }" readonly>
										</c:otherwise>
									</c:choose>
									
								<!-- </div> -->
						</c:forEach>
					</c:if>
					<!-- 댓글부분 -->
		</span>
				
	
				
				
				
				<%-- <c:if test="${sessionScope.loginid == b.writer.id }">
					<tr>
						<td><c:if test="${b.writer.id==sessionScope.loginid}">
								<a href="/board/modify/${b.num }"><input class="edit-btn" type="button"
									value="수정"></a>
								
								<input class="del-btn"type="button" value="삭제" onclick="del()">
							</c:if></td>
					</tr>
				</c:if> --%>
				
				<c:if test="${sessionScope.loginid == b.writer.id }">
					<tr>
						<td><c:if test="${b.writer.id==sessionScope.loginid}">
								<a href="/board/modify/${b.num }"><input class="edit-btn2" type="button"
									value="수정"></a>
								
								<input class="del-btn2" type="button" value="삭제" onclick="del()">
							</c:if></td>
					</tr>
				</c:if>
				<!-- 수정완료 -->
	</form>
	<!-- 			<img src="https://health.chosun.com/site/data/img_dir/2021/01/27/2021012702508_0.jpg" alt="dimg" /> -->
	<!-- Bootstrap core JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/scripts.js"></script>
</span>
</body>

</html>

