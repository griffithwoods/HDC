

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <style><%@include file="/WEB-INF/styles/adminhome.css"%></style>
        <style><%@include file="/WEB-INF/styles/navbar.css"%></style>
        <style><%@include file="/WEB-INF/styles/manageorders.css"%></style>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clH="TMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


        <title>HDC - Manage Orders</title> 
    </head>
    <body>


        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand mb-0 h1">Helen's Delicious Cakes</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="manageorders">Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="managecakes">Cakes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="managecustomers">Users</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="managepickups">Pickups</a>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="nav-item"><a class="nav-link" href="login"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>



        <p>${errorMessage}</p>

        <div class = "col-sm-3">
            <!--can admin add cake--> 
            <c:if test="${selectedOrder == null}">
                <h3>Edit Order</h3>
                <form action="manageorders" method="POST">
                    <table>

                        <tr><td>Order No</td><td><input type="text" name="orderNo" value="" readonly></td></tr>
                        <tr><td>Order Time</td><td><input type="text" name="orderDatetime" value="" readonly></td></tr>
                        <tr><td>Due Time</td><td><input type="text" name="orderDatetime" value="" readonly></td></tr>
                        <tr><td>Total</td><td><input type="text" name="orderDatetime" value="" readonly></td></tr>
                        <tr><td>deliveryNo</td><td><input type="text" name="orderDatetime" value="" readonly></td></tr>
                        <tr><td>User Name</td><td><input type="text" name="userId" value="" readonly></td></tr>
                        <tr><td>PhoneNo</td><td><input type="text" name="userId" value="" readonly></td></tr>
                        <tr><td>Email</td><td><input type="text" name="userId" value="" readonly></td></tr>
                        <tr><td>Del Method</td><td><input type="text" name="deliveryMethod" value="" readonly></td></tr>
                        <tr><td>Address</td><td><input type="text" name="deliveryAddress" value="" readonly></td></tr>
                        <tr><td>Phone No.</td><td><input type="text" name="deliveryPhoneNo" value="" readonly></td></tr>
                        <tr><td>Notes</td><td><input type="text" name="deliveryNotes" value="" readonly></td></tr>
                        <tr><td>Active</td><td><input type="checkbox"  name="active"></td></tr>
                        <tr><td>Confirmed</td><td><input type="checkbox"  name="confirmed"></td></tr>
                        <tr><td>Paid</td><td><input type="checkbox"  name="paid"></td></tr>
                        <input type="hidden" name="selectedOrderId" value="${selectedOrder.orderNo}">     
                        <input type="hidden" name="action" value="add">
                    </table>
                    <input type="submit" value="Save">
                </form>
            </c:if>
            <c:if test="${selectedOrder != null}">
                <h3>Edit Order</h3>
                <form action="manageorders" method="POST">

                    <table>

                        <tr><th>Order No</th><td><input type="text" name="orderNo" value="${selectedOrder.orderNo}" readonly></td></tr>
                        <tr><th>Order Time</th><td><input type="text" name="orderDatetime" value="${selectedOrder.orderDatetime}" readonly></td></tr>
                        <tr><th>Due Time</th><td><input type="text" name="dueDatetime" value="${selectedOrder.dueDatetime}"></td></tr>
                        <tr><th>Total</th><td><input type="text" name="totalPrice" value="${selectedOrder.totalPrice}"></td></tr>
                        <tr><th>deliveryNo</th><td><input type="text" name="deliveryNo" value="${selectedOrder.deliveryNo.deliveryNo}" readonly></td></tr>
                        <tr><th>User Name</th><td><input type="text" name="userId" value="${user.username}" readonly></td></tr>
                        <tr><th>PhoneNo</th><td><input type="text" name="userId" value="${user.phoneNo}" readonly></td></tr>
                        <tr><th>Email</th><td><input type="text" name="userId" value="${user.email}" readonly></td></tr>
                        <tr><th>Del Method</th><td><input type="text" name="method" value="${delivery.method}" ></td></tr>
                        <tr><th>Address</th><td><input type="text" name="address" value="${delivery.address}"></td></tr>
                        <tr><th>Phone No.</th><td><input type="text" name="phoneNo" value="${delivery.phoneNo}"></td></tr>
                        <tr><th>Notes</th><td><input type="text" name="notes" value="${delivery.notes}"></td></tr>
                        <tr><th>Active</th><td><input type="checkbox" <c:if test="${selectedOrder.active==true}">checked</c:if> name="active"></td></tr>
                        <tr><th>Confirmed</th><td><input type="checkbox" <c:if test="${selectedOrder.confirmed==true}">checked</c:if> name="confirmed"></td></tr>
                        <tr><th>Paid</th><td><input type="checkbox" <c:if test="${selectedOrder.paid==true}">checked</c:if> name="paid"></td></tr>
                            <tr><td></td><td></td><td></td></tr>
                            <input type="hidden" name="selectedOrderId" value="${selectedOrder.orderNo}">
                        <input type="hidden" name="action" value="edit">

                        <tr><td>     </td><td><input type="submit" value="Save"></td></tr>
                        <!--table to show cakes info in this order-->
                    </table>

                </form>
                <!--table to show cakes info in this order-->
                <table>
                    <thead>
                    <th>Image</th>
                    <th>Name</th>
                    <!--<th>Description</th>-->
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Chg.Qty</th>
                    </thead>
                    <c:forEach var="cakeOrder" items="${cakeOrders}" varStatus="cakeOrderIndex"> 
                        <form action="manageorders" method="post" >
                            <tr>
                                <td><img src="<c:url value='${cakeOrder.cake.image}'/>" alt="Cake Picture" width="80dp" height="80dp"/></td>
                                <td width="20%">${cakeOrder.cake.name}</td>
                                <!--<td width="40%">${cakeOrder.cake.description}</td>-->
                                <td >${cakeOrder.cake.price}</td>
                                <td><input type="number" name="quantity" value="${cakeOrder.quantity}" min="0" max="20" ></td>
                                <td>
                                    <input type="submit" value="Chg.Qty">
                                    <input type="hidden" name="action" value="changeQuantity">
                                    <input type="hidden" name="selectedCakeOrder" value="${cakeOrderIndex.index}">
                                    <input type="hidden" name="selectedOrderId" value="${cakeOrder.orders.orderNo}">
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <td colspan="4">SubTotal</td><td width="5%"><c:out value="${selectedOrder.totalPrice}"/></td>
                </table>     
            </c:if> 
        </div>

        <div class="col-sm-9">
            <h3>Orders</h3>

            <form action="manageorders" method="post" >
                <input type="submit" value="Undo">
                <input type="hidden" name="action" value="undo">
            </form>
            <table>

                <th>Order No</th>
                <th>Order Time</th>
                <th>Due Time</th>
                <th>Order Items</th>
                <th>Total</th>
                <th>deliveryNo</th>
                <th>userName</th>
                <th>Active</th>
                <th>Confirmed</th>
                <th>Paid</th>
                <th>Delete</th>
                <th>Edit</th>

                <c:forEach var="order" items="${orders}">               
                    <tr>
                        <td>${order.orderNo}</td>
                        <td>${order.orderDatetime}</td>
                        <td>${order.dueDatetime}</td>
                        <td>${order.orderItems}</td>
                        <td>${order.totalPrice}</td>
                        <td>${order.deliveryNo.deliveryNo}</td>
                        <td>${order.userId.username}</td>
                        <td><input type="checkbox" <c:if test="${order.active==true}">checked</c:if> name="active"></td>
                        <td><input type="checkbox" <c:if test="${order.confirmed==true}">checked</c:if> name="active"></td>
                        <td><input type="checkbox" <c:if test="${order.paid==true}">checked</c:if> name="active"></td>
                            <td>
                                <form action="manageorders" method="post" >
                                    <input type="submit" value="Delete">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="selectedOrderId" value="${order.orderNo}">
                            </form>
                        </td>
                        <td>
                            <form action="manageorders" method="get">
                                <input type="submit" value="Edit">
                                <input type="hidden" name="action" value="view">
                                <input type="hidden" name="selectedOrderId" value="${order.orderNo}">
                            </form>
                        </td>
                    </tr>

                </c:forEach>
            </table>

        </div>




    </body>
</html>
