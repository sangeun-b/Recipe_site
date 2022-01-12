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
        <script type ="text/javascript">
        const xhttp = new XMLHttpRequset();
        
        xhttp.onload = function () {
        	if(xhttp.readyState==4){//요청이 잘 갔는지 확인
        		if (xhttp.status === 200 || xhttp.status === 201) {
        		    console.log(xhttp.responseText);
        		  } else {
        		    console.error(xhttp.responseText);
        		  }
        		};
        		xhttp.open('GET', 'http://localhost:8081/board/detail/');
        		xhttp.send(null);
    }        
        </script> 
        <!-- <script>
    
        var banner = new Array();

         banner[0]="<a href='#'><img src='#' border='0' width='100%' height='100%'></a>";
         banner[1]="<a href='#'><img src='#' border='0' width='100%' height='100%'></a>";
         banner[2]="<a href='#'><img src='#' border='0' width='100%' height='100%'></a>";
       
         var random_banner = Math.floor(Math.random()*(banner.length));
     </script>

     <script>document.write(banner[random_banner]);</script> -->
     
     
    </head>
    <body onload="showImage()">
        <!-- Page content-->
        <div class="container">
            <div class="text-center mt-5">
                <h1>오늘의 추천</h1>
                
               
                <img id = "introImg" border="0">
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../resources/js/scripts.js"></script>
    </body>
</html>
