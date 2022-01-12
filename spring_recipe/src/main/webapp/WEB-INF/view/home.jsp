<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Cook Recipe Site</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../resources/assets/main-logo.svg" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/css/styles.css" rel="stylesheet" />
        <script>
//         window.onload = function(){
//         	location.href="board/ranboard";
        	
//         }

        </script>
    </head>
    <body>
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>오늘의 추천</h1>
                <img id = "introImg" border="0">
                
				<div style="border: 1px solid; float: left; width: 33%;">
					<a href="/board/detail/${b.num }"><img
					src="/board/readimg/${b.img_path }/${b.num}" width="100" height="100"></a><br />
					<a href="/board/detail/${b.num }">${b.title }</a><br />
					난이도 ${b.difficulty }<br />
			</div>

            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>