<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clH="TMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="shortcut icon" href="<c:url value='/images/hdclogo.png'/>">

        <style><%@include file="/WEB-INF/styles/login.css"%></style>
        <style><%@include file="/WEB-INF/styles/navbar.css"%></style>

    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="mainmenu"><img class="icon" src="<c:url value='/images/hdclogo.png'/>" /> </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="mainmenu">主页</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="browse">浏览</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">联系我们
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart">购物车<span class="badge badge-pill badge-secondary">${fn:length(cakes)}</span></a>
                        </li>
                        <li class="nav-item"> </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">

<!--                        <form class="form-inline my-2 my-lg-0" action="search" method="post">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchWord">
                            <input type="hidden" name="action" value="Search">
                        </form>-->


                        <li class="nav-item active">
                            <a class="nav-link" href="login">
                                登录/注册
                            </a>
                        </li>

                        <!--button toggle ch/en-->
                        <li class="nav-item">
                            <a class="nav-link" href="lang?act=en"><i class="fas fa-globe-americas"></i>  English </a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>
                        
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card card-signin my-5">
                        <div class="card-body">
                            <h5 class="card-title text-center">注册</h5>
                            <h5 class="card-title text-center" style="color:blue;">${error}</h5>
                            <h5 class="card-title text-center" style="color:green;">${status}</h5>

                            <form class="form-signin" method="POST">
                                <div class="form-label-group">
                                    <input type="text" id="inputUser" name="username" class="form-control" placeholder="Username" value="${username}" required autofocus>
                                    <label for="inputUser">用户名</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" value="${password}" required>
                                    <label for="inputPassword">输入密码</label>
                                </div>
                                
                                <div class="form-label-group">
                                    <input type="password" id="inputConfirmPassword" name="confirmpassword" class="form-control" placeholder="ConfirmPassword" value="${confirmPassword}" required>
                                    <label for="inputConfirmPassword">确认密码</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputFirstName" name="firstname" class="form-control" placeholder="First Name" value="${firstname}" required autofocus>
                                    <label for="inputFirstName">名</label>
                                </div>
                                
                                <div class="form-label-group">
                                    <input type="text" id="inputLastName" name="lastname" class="form-control" placeholder="Last Name" value="${lastname}" required autofocus>
                                    <label for="inputLastName">姓</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputAddress" name="address" class="form-control" placeholder="Address" value="${address}" required autofocus>
                                    <label for="inputAddress">地址</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputPostal" name="postal" class="form-control" placeholder="Postal Code" value="${postal}" required autofocus>
                                    <label for="inputPostal">邮编</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputEmail" name="email" class="form-control" placeholder="Email Address" value="${email}" required autofocus>
                                    <label for="inputEmail">电子邮件</label>
                                </div>

                                <div class="form-label-group">
                                    <input type="text" id="inputPhone" name="phone" class="form-control" placeholder="Phone" value="${phone}" required autofocus>
                                    <label for="inputPhone">电话</label>
                                </div>

                                <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">注册</button>
                                <hr class="my-4">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>


</html>
