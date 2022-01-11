<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="">Cook Recipe </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link active" href="/board/list_cate">Board</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
								
								<c:if test = "${sessionScope.loginid == null}">
                                	<li><a class="dropdown-item" href="/user/login">Login</a></li>
                                	<li><a class="dropdown-item" href="/user/join">Join</a></li>
   								</c:if>
   								
   								<c:if test = "${sessionScope.loginid != null }">
                                <li><a class="dropdown-item" href="/heart/list">like</a></li>
                                <li><a class="dropdown-item" href="/user/myinfo">Myinfo</a></li>
                                <li><a class="dropdown-item" href="/user/logout">Logout</a></li>
                     			</c:if>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>