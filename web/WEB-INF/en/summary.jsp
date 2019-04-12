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
        <link rel="shortcut icon" href="<c:url value='/images/hdclogo.png'/>">

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

                <a class="navbar-brand" href="mainmenu"><img class="icon" src="<c:url value='/images/hdclogo.png'/>" />
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="mainmenu">Home</a>
                        </li>
                        <li class="nav-item active">
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


        <br>
        <div class="container">
            <h1 class="text-center">Summary</h1>
            <br>
            <div class="row">
                <div class="col-md-6">
                    <table class="table-bordered">
                        <tr>
                            <th>Order No</th>
                            <td>${selectedOrder.orderNo}</td>
                        </tr>
                        <tr>
                            <th>Order Time</th>
                            <td>${selectedOrder.orderDatetime}</td>
                        </tr>
                        <tr>
                            <th>Due Time</th>
                            <td>${selectedOrder.dueDatetime}</td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td>${selectedOrder.totalPrice}</td>
                        </tr>
                        <tr>
                            <th>Delivery No.</th>
                            <td>${selectedOrder.deliveryNo.deliveryNo}</td>
                        </tr>
                        <tr>
                            <th>User Name</th>
                            <td>${user.username}</td>
                        </tr>
                        <tr>
                            <th>User Phone No.</th>
                            <td>${user.phoneNo}</td>
                        </tr>
                        <tr>
                            <th>User Email</th>
                            <td>${user.email}</td>
                        </tr>
                        <tr>
                            <th>Delivery Method</th>
                            <td>${delivery.method}</td>
                        </tr>
                        <tr>
                            <th>Delivery Address</th>
                            <td>${delivery.address}</td>
                        </tr>
                        <tr>
                            <th>Delivery Phone No.</th>
                            <td>${delivery.phoneNo}</td>
                        </tr>
                        <tr>
                            <th>Notes</th>
                            <td>${delivery.notes}</td>
                        </tr>
                    </table>
                </div>

                <div class="col-md-6">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th class="col-md-2"></th>
                                <th class="col-md-4">Name</th>
                                <th class="col-md-3">Price</th>
                                <th class="col-md-3">Qty</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cakeOrder" items="${cakeOrders}" > 
                                <tr>
                                    <td><img src="<c:url value='${cakeOrder.cake.image}'/>" alt="Cake Picture" width="80dp" height="80dp"/></td>
                                    <td width="20%">${cakeOrder.cake.name}</td>
                                    <td >${cakeOrder.cake.price}</td>
                                    <td>${cakeOrder.quantity}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <hr>

                    <div>
                        <h2>Please choose your payment method:</h2>

                        <div class="row">
                            <div class="col-md-6">
                                <form>
                                    <input type="radio" name="payment" value="paypal" checked> Paypal<br>
                                    <input type="radio" name="payment" value="etransfer"> INTERAC e-Transfer<br>
                                    <input type="radio" name="payment" value="cod"> Cash On Delivery
                                </form> 
                            </div>

                            <div class="col-md-6">
                                <div id="paypaytab" style="display: none;" class="align-middle">
                                    <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
                                        <input type="hidden" name="cmd" value="_xclick">
                                        <input type="hidden" name="business" value="YMPFXKHT6YJTC">
                                        <input type="hidden" name="lc" value="CA">
                                        <input type="hidden" name="item_name" value="Cake">
                                        <input type="hidden" name="button_subtype" value="services">
                                        <input type="hidden" name="no_note" value="1">
                                        <input type="hidden" name="no_shipping" value="1">
                                        <input type="hidden" name="rm" value="1">
                                        <input type="hidden" name="return" value="http://localhost:8084/HDCProject/payment?payment=success">
                                        <input type="hidden" name="cancel_return" value="http://localhost:8084/HDCProject/payment?payment=fail">
                                        <input type="hidden" name="currency_code" value="CAD">
                                        <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHosted">
                                        <input type="hidden" name="amount" value="${totalPrice}">
                                        <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                                        <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
                                    </form>
                                </div>

                                <div id="etranstertab" style="display: none;" class="align-middle">
                                    <form action="payment" method="GET">                                      
                                        <input type="submit" value="Place Your Order">
                                        <input type="hidden" name="payment" value="etrasfer">  
                                    </form> 
                                    <p>Please send to:helenbkf@gmail.com</p>
                                </div>

                                <div id="codtab" style="display: none;" class="align-middle">
                                    <form action="payment" method="GET">                                    
                                        <input type="submit" value="Place Your Order">
                                        <input type="hidden" name="payment" value="cash">  
                                    </form> 
                                </div>
                            </div>
                        </div>


                        <script>
                            $(document).ready(function () {
//                                default show paypal button
                                $("#paypaytab").show();
                                $("#etranstertab").hide();
                                $("#codtab").hide();
                                $('input:radio[name=payment]').change(function () {
                                    if (this.value == 'paypal') {
                                        $("#paypaytab").show();
                                        $("#etranstertab").hide();
                                        $("#codtab").hide();
                                    } else if (this.value == 'etransfer') {
                                        $("#paypaytab").hide();
                                        $("#etranstertab").show();
                                        $("#codtab").hide();
                                    } else if (this.value == 'cod') {
                                        $("#paypaytab").hide();
                                        $("#etranstertab").hide();
                                        $("#codtab").show();
                                    }
                                });
                            });
                        </script>


                    </div>

                </div>
            </div>


        </div>

        <br>

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
