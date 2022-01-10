<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
 
<script>
//만약 flag가 true면 fill heart, flag가 false면 빈 heart
//하트 클릭해서 DB에 저장되면 빈 하트 -> 채워진 하트
//1. click -> show & hide?
//2. click -> class name 변경해서 css로 변경
$(document).ready(function(){
   
    /*img1을 클릭했을 때 img2를 보여줌*/
    $("#img1").click(function(){
        $("#img1").hide();
        $("#img2").show();
    });

    /*img2를 클릭했을 때 img1을 보여줌*/
    $("#img2").click(function(){
        $("#img1").show();
        $("#img2").hide();
    });
});

</script>
</head>
<body>
<img id="img1" src="../resources/assets/recipe_icons/heart.png" style="width:40px; height:40px;">
<img id="img2" src="../resources/assets/recipe_icons/heart_fill.png" style="width:40px; height:40px; display:none">
</body>
</html>