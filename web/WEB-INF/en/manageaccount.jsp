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
        <link rel="shortcut icon" href="<c:url value='/images/hdclogo.png'/>">

        <!--bootstrap heading-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/additional-methods.js"></script>

        <style><%@include file="/WEB-INF/styles/navbar.css"%></style>
        <style><%@include file="/WEB-INF/styles/mainmenu.css"%></style>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="mainmenu"><img class="icon" src="<c:url value='/images/hdclogo.png'/>" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="mainmenu">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="browse">Browse</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact">Contact
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart">Cart <span class="badge badge-pill badge-secondary">${fn:length(cakes)}</span></a>
                        </li>
                        <li class="nav-item"> </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">

                        <form class="form-inline my-2 my-lg-0" action="search" method="post">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchWord">
                            <input type="hidden" name="action" value="Search">
                        </form>


                        <c:if test="${userObj != null}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-user-circle"></i> 
                                    ${userObj.name} 
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="manageaccount">My Profile</a>
                                    <a class="dropdown-item" href="orders">My Orders</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="login?act=logout"><i class="fas fa-sign-out-alt"></i> Log Out</a>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${userObj == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="login">
                                    Login/Register
                                </a>
                            </li>
                        </c:if>

                        <!--button toggle ch/en-->
                        <li class="nav-item">
                            <a class="nav-link" href="lang?act=cn"><i class="fas fa-globe-americas"></i>  中文 </a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>


        <div class="container">
            <div class="col-md-9" style="margin: auto">
                <br>
                <h1 class="text-center">Profile</h1>
                <br>
                <h3 class="text-center">${prompt}</h3>
                <form action="manageaccount" name="registration" method="post" >
                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputUser">Username</label>
                        <div class="col-md-10">
                            <input type="text" id="inputUser" name="username" class="form-control" value="${sessionScope.userObj.username}" readonly>
                        </div>
                    </div>

                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputName">Name</label>
                        <div class="col-md-10">
                            <input type="text" id="inputName" name="name" class="form-control" value="${sessionScope.userObj.name}" readonly>
                        </div>
                    </div>

                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputAddress">Address</label>
                        <div class="col-md-10">

                            <input type="text" id="inputAddress" name="address" class="form-control" value="${sessionScope.userObj.address}" readonly>
                        </div>
                    </div>
                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputPostal">Postal Code</label>
                        <div class="col-md-10">
                            <input type="text" id="inputPostal" name="postal" class="form-control" value="${sessionScope.userObj.postalCode}" readonly>
                        </div>
                    </div>

                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputEmail">Email Address</label>
                        <div class="col-md-10">
                            <input type="text" id="inputEmail" name="email" class="form-control" value="${sessionScope.userObj.email}" readonly>
                        </div>
                    </div>

                    <div class="form-label row">
                        <label class="col-md-2 col-form-label" for="inputPhone">Phone Number</label>
                        <div class="col-md-10">
                            <input type="text" id="inputPhone" name="phone" class="form-control" value="${sessionScope.userObj.phoneNo}" readonly>
                        </div>
                    </div>

                    <br>
                    <div style="display: none;" id="confirmbtn">
                        <div class="d-flex justify-content-center" style="display: none;">
                            <button type="submit" class="btn btn-primary" id="submitbtn">Confirm</button>
                        </div>
                    </div>
                    <br>
                    <input type="hidden" name="action" value="change">
                </form>
            </div>
            <div style="display: none;" id="cancelbtn">
                <div class="d-flex justify-content-center" >
                    <button src="manageacount" type="button" class="btn btn-danger">Cancel</button>          
                </div>
            </div>

            <div class="d-flex justify-content-center">
                <button type="button" class="btn btn-info" id="editbtn">Edit My Profile</button>
            </div>
            <script>
                $(document).ready(function () {
                    $('#editbtn').click(function () {
                        $('#editbtn').hide();
                        $('#cancelbtn').show();
                        $('#confirmbtn').show();

                        $("#inputName").attr("readonly", false);
                        $("#inputAddress").attr("readonly", false);
                        $("#inputPostal").attr("readonly", false);
                        $("#inputPhone").attr("readonly", false);
                    });

                    $('#cancelbtn').click(function () {
                        $('#editbtn').show();
                        $('#cancelbtn').hide();
                        $('#confirmbtn').hide();

                        $("#inputName").attr("readonly", true);
                        $("#inputAddress").attr("readonly", true);
                        $("#inputPostal").attr("readonly", true);
                        $("#inputPhone").attr("readonly", true);
                    });
                });


                $(function () {
                    $("form[name='registration']").validate({
                        rules: {
                            address: "required",
                            name: "required",
                            phone: {
                                required: true,
                                phoneUS: true
                            }, postal: {
                                required: true,
                                pattern: '^[a-zA-z]{1}[0-9]{1}[a-zA-z]{1}[0-9]{1}[a-zA-Z]{1}[0-9]{1}'
                            }
                        },
                        messages: {
                            name: "Please enter your name",
                            address: "Please enter your address",
                            phone: {
                                required: "Please enter a phone number",
                                phoneUS: "Please format as 111-222-3333"
                            }, postal: {
                                required: "Please a postal code",
                                pattern: "Please format as A1B2D3"
                            }
                        },
                        errorElement: 'div',
                        errorLabelContainer: '.errorTxt'
                    });
                });
            </script>
            <br>
            <br>

            <hr>
            <div class="col-md-7" style="margin: auto">
                <h2 class="text-center">Change Password</h2>
                <form action="manageaccount" method="post" >

                    <div class="form-label row">
                        <label class="col-md-4 col-form-label" for="currentPassword">Current Password</label>
                        <div class="col-md-8">
                            <input type="password" name="currentPassword" class="form-control">
                        </div>
                    </div>
                    <div class="form-label row">
                        <label class="col-md-4 col-form-label" for="newPassword">New Password:</label>
                        <div class="col-md-8">
                            <input type="password" name="newPassword" class="form-control">
                        </div>
                    </div>
                    <div class="form-label row">
                        <label class="col-md-4 col-form-label" for="newPasswordConfirm">New Password Confirm:</label>
                        <div class="col-md-8">
                            <input type="password" name="newPasswordConfirm" class="form-control">
                        </div>
                    </div>
                    <br>

                    <input type="hidden" name="action" value="changePassword">
                    <div class="d-flex justify-content-center">
                        <button type="submit" class="btn btn-info">Okay</button>
                    </div>

                </form>
            </div>
            <br>



        </div>

      <footer class="page-footer font-small" id="bottomfooter">
            <br>
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-5 text-center">
                        <div style="margin: auto; width: 70%;">
                            <h6 class="text-uppercase font-weight-bold footertext">Helen's Delicious Cakes, Inc.</h6>
                            <hr class="col-md-8">
                            <p class="footertext">Helen's Delicious Cakes is a locally owned small business that prides itself on making fresh cakes daily. Our cakes are scratch-baked, and customised to suit your needs. Please don't hesitate to contact us with any questions.</p>
                        </div>

                    </div>
                    <div class="col-md-2 text-center" style="margin: auto;">
                        <h6 class="text-uppercase font-weight-bold footertext">Follow Us</h6>
                        <hr class="col-md-8">

                        <p>
                            <a href="#" class="fab fa-instagram footertext"> instagram</a> 
                        </p>
                        <p>
                            <a href="#" class="fab fa-weixin footertext"> wechat</a>
                        </p>

                    </div>
                    <div class="col-md-5 text-center" style="margin: auto;">
                        <h6 class="text-uppercase font-weight-bold footertext">Contact</h6>
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
                Copyright © Helen's Delicious Cakes. All rights reserved.
            </div>
        </footer>
    </body>
</html>
