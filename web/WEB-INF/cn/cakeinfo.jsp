<%-- 
    Document   : mainmenu
    Created on : Feb 7, 2019, 2:45:09 PM
    Author     : 703842
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Helen Delicious Cakes</title>

        <!--bootstrap heading-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <style><%@include file="/WEB-INF/styles/navbar.css"%></style>
        <style><%@include file="/WEB-INF/styles/mainmenu.css"%></style>


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
                        <li class="nav-item active">
                            <a class="nav-link" href="browse">浏览</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact">联系我们
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


                        <c:if test="${userObj != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-user-circle"></i> 
                                    ${userObj.name} 
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="manageaccount">我的账号</a>
                                    <a class="dropdown-item" href="orders">我的订单</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login?act=logout"><i class="fas fa-sign-out-alt"></i> 登出</a>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${userObj == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login">
                                    登录/注册
                                </a>
                            </li>
                        </c:if>

                        <!--button toggle ch/en-->
                        <li class="nav-item">
                            <a class="nav-link" href="lang?act=en"><i class="fas fa-globe-americas"></i>  English </a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>


        <br>
        <div class="container">

            <h1 class="text-center">${currCake.namecn}</h1>

            <br>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <img class="rounded" src="<c:url value='${currCake.image}'/>" alt="Cake Picture" height="240" width="240">
                    </div>
                    <div class="col-md-5">

                        <h4><i>价格</i><font color="red"> $${currCake.price}</font></h4>
                        <h4><i>尺寸</i><font color="blue"> ${currCake.size}"</font></h4>
                        <br>
                        <p><strong>描述：</strong> ${currCake.descriptioncn}</p>
                    </div>

                    <div class="col-md-3">
                        <form action="cakeinfo" method="POST" class="form-inline">
                            <div class="form-group row">
                                <strong></strong>
                            </div>
                            <!--                            <input type="number" name="quantity" value="1" min="1" max="20" style="width: 20%;">-->
                            <div class="form-group row">
                                <i class="minus fas fa-minus-square fa-2x" ></i>
                                <input type="text" name="quantity" class="form-control" style="width: 20%;" value="1" readonly/>
                                <i class="plus fas fa-plus-square fa-2x"></i>
                            </div>

                            <input type="hidden" name="cakeId" value="${currCake.cakeId}">
                            <div class="form-group row">
                                <button type="submit" class="btn btn-warning">添加入购物车</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <a href="mainmenu" class="btn btn-outline-dark" style=" float: right;">继续选购</a>

                        &nbsp
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>


        <script>
            $(document).ready(function () {
                $('.minus').click(function () {
                    var $input = $(this).parent().find('input');
                    var count = parseInt($input.val()) - 1;
                    count = count < 1 ? 1 : count;
                    $input.val(count);
                    $input.change();
                    return false;
                });
                $('.plus').click(function () {
                    var $input = $(this).parent().find('input');
                    $input.val(parseInt($input.val()) + 1);
                    $input.change();
                    return false;
                });
            });
        </script>

        <br>

        <footer class="page-footer font-small" id="bottomfooter">
            <br>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-5 text-center">
                        <div style="margin: auto; width: 70%;">
                            <h6 class="text-uppercase font-weight-bold footertext">海燕美味蛋糕</h6>
                            <hr class="col-md-8">
                            <p class="footertext">由海燕精心制作的蛋糕松软可口、细腻绵软、甜度适中，适合所有人的口味</p>
                        </div>

                    </div>
                    <div class="col-md-2 text-center" style="margin: auto;">
                        <h6 class="text-uppercase font-weight-bold footertext">关注我们</h6>
                        <hr class="col-md-8">

                        <p>
                            <a href="#" class="fab fa-instagram footertext"> instagram</a> 
                        </p>
                        <p>
                            <a href="#" class="fab fa-weixin footertext"> wechat</a>
                        </p>

                    </div>
                    <div class="col-md-5 text-center" style="margin: auto;">
                        <h6 class="text-uppercase font-weight-bold footertext">联系方式</h6>
                        <hr class="col-md-5">
                        <p class="footertext">
                            <i class="fas fa-envelope mr-3 "></i>  <a href="mailto:helenbkf@gmail.com?Subject=Customer%20Contact" target="_top">helenbkf@gmail.com</a>
                        </p>
                        <p class="footertext">
                            <i class="fas fa-phone mr-3 "></i>(403) 603-0087
                        </p>
                    </div>
                </div>
            </div>
            <div class="footer-copyright text-center py-3 footertext">
                版权所有 © 海燕美味蛋糕 
            </div>
        </footer>


    </body>
</html> 
