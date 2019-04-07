<%-- 
    Document   : orders
    Created on : 1-Mar-2019, 1:52:41 PM
    Author     : Knyfe
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
        <style><%@include file="/WEB-INF/styles/orders.css"%></style>


    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="#"> H D C </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
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
                            <a class="nav-link" href="cart">Cart<span class="badge badge-pill badge-secondary">${fn:length(cakes)}</span></a>
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
        <h1 align="center">Orders</h1>
        <p align="center">${error}</p>
<<<<<<< HEAD
        <p align="center">To Cancel an Order Please Contact Us!</p>
        <table align="center">
            <c:forEach items="${orderList}" var="order">
                <form action="Orders" method="POST">
                    <tr>
                        <th>Order Number:</th>
                        <td><c:out value="${order.orderNo}"/></td>
                    </tr>
                    <tr>
                        <th>Date Placed:</th>
                        <td><c:out value="${order.orderDatetime}"/></td>
                    </tr>
                    <tr>
                        <th>Order Due:</th>
                        <td><c:out value="${order.dueDatetime}"/></td>
                    </tr>
                    <tr>
                        <th>Items:</th>
                        <td><c:out value="${order.orderItems}"/></td>
                    </tr>
                    <tr>
                        <th>Total Price:</th>
                        <td><c:out value="$:${order.totalPrice}"/></td>
                    </tr>
                    <tr>
                        
                        
                        
                        <th>Order Status</th>
                        <td>
                                <c:set var = "active" scope = "session" value = "${order.active}"/>
                                <c:set var = "confirmed" scope = "session" value = "${order.confirmed}"/>
                                <c:if test = "${active == true}">
                                    <c:if test = "${confirmed == false}">
                                        <c:out value="Processing"/>
                                    </c:if>
                                </c:if>
                                <c:if test = "${active == true}">
                                    <c:if test = "${confirmed == true}">
                                        <c:out value="Confirmed"/>
                                    </c:if>
                                </c:if>
                                <c:if test = "${active == false}">
                                    <c:if test="${confirmed == true}">
                                        <c:out value="Completed"/>
                                    </c:if>
                                </c:if>
                                <c:if test = "${active == false}">
                                    <c:if test = "${confirmed == false}">
                                        <c:out value="Cancelled"/>
                                    </c:if>
                                </c:if>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <th>Payment Status</th>
                        <td>
                            <c:set var = "paid" scope = "session" value = "${order.paid}"/>
                            <c:if test = "${paid == true}">
                                <c:out value="Paid"/>
                            </c:if>
                            <c:if test = "${paid == false}">
                                <c:out value="Not Paid"/>
                            </c:if>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </table>
=======
        <p style="color:red" align="center">${notdeleted}</p>
        <p style="color:green" align="center">${deleted}</p>

        <div class="container-fluid" id="ordercontainer">
            <c:if test="${orderList != null}">
                <c:forEach items="${orderList}" var="order">
                    <table class="table border">
                        <thead class="table-active">
                            <tr>
                                <th class="col-md-3">
                                    Order Number: 
                                    <c:out value="${order.orderNo}"/>
                                </th>
                                <th class="col-md-6">
                                    Date Placed: 
                                    <c:out value="${order.orderDatetime}"/>
                                </th>
                                <th class="col-md-3">
                                    Total: 
                                    <c:out value="$${order.totalPrice}"/>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${order.cakeCollection}" var="ite">
                                <tr>
                                    <td><img height="100em" src="<c:url value='${ite.image}'/>" /></td>
                                    <td><c:out value="${ite.name}"/></td>
                                    <td>Price: $<c:out value="${ite.price}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:forEach>
            </c:if>

        </div>


        <div class="containter" id="bottomfooter">
            <!-- Footer -->
            <br>
            <footer class="page-footer font-small unique-color-dark">


                <!-- Footer Links -->
                <div class="container text-center text-md-left mt-5">

                    <!-- Grid row -->
                    <div class="row mt-3">

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

                            <!-- Content -->
                            <h6 class="text-uppercase font-weight-bold footertext">Hellen Delicious Cakes, Inc.</h6>
                            <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p class="footertext">Here you can use rows and columns here to organize your footer content. Lorem ipsum dolor sit amet, consectetur
                                adipisicing elit.</p>

                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

                            <!-- Links -->
                            <h6 class="text-uppercase font-weight-bold footertext">Follow Us</h6>
                            <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p>
                                <a href="#" class="fab fa-facebook footertext"> facebook</a>  
                            </p>
                            <p>
                                <a href="#" class="fab fa-instagram footertext"> instagram</a> 
                            </p>
                            <p>
                                <a href="#" class="fab fa-weixin footertext"> wechat</a>                            </p>
                            </p>


                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

                            <!-- Links -->
                            <h6 class="text-uppercase font-weight-bold footertext">Contact</h6>
                            <hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
                            <p class="footertext">
                                <i class="fas fa-home mr-3 "></i>188 Springbluff Blvd SW <br>Calgary, AB</p>
                            <p class="footertext">
                                <i class="fas fa-envelope mr-3 "></i>  <a href="mailto:#">helen@gmail.com</a></p>
                            <p class="footertext">
                                <i class="fas fa-phone mr-3 "></i>(403) 808-3860</p>

                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                </div>
                <!-- Footer Links -->

                <!-- Copyright -->
                <div class="footer-copyright text-center py-3 footertext">
                    Copyright © Helen's Delicious Cakes. All rights reserved
                </div>
                <!-- Copyright -->

            </footer>
            <!-- Footer -->
        </div>


>>>>>>> 0784a0fa3ac47c7b411f677e0b4450cc4cbb4da9
    </body>
</html> 
