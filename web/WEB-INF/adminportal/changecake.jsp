<%-- 
    Document   : editcake
    Created on : Feb 21, 2019, 7:42:13 PM
    Author     : 775224
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="<c:url value='/images/hdclogo.png'/>">


        <style><%@include file="/WEB-INF/styles/adminhome.css"%></style>
        <style><%@include file="/WEB-INF/styles/navbar.css"%></style>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clH="TMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">


        <title>Edit Cake</title>
    </head>

    <body>

        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand mb-0 h1" href="adminhome"><img class="icon" src="<c:url value='/images/hdclogo.png'/>" /></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="manageorders">Orders</a>
                        </li>
                        <li class="nav-item active">
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
                        <li class="nav-item"><a class="nav-link" href="login?act=logout"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <div class="card">
            <div class="card-body">  
                <p id="headertitle"><strong>Edit Cake</strong></p>
                <hr>

                <div class="container">
                    <div class ="row">
                        <div class="col-md-6">
                            <table class="table table-bordered text-md-center mt-5">
                                <tbody>

                                    <tr>
                                        <td scope="row">
                                            <img src="<c:url value='${cake.image}'/>" alt="Cake Picture" width="200" height="200"/>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-12">

                                    <form action="changecake" method="post">
                                        <div class="form-row">
                                            <div class="form-group col-md-8">
                                                <div id="inputHeader">Cake Name</div>
                                                <input type="text" class="form-control" name="name" value="${cake.name}">
                                            </div>
                                            <div class="form-group col-md-4">
                                                <div id="inputHeader">Price ($)</div>
                                                <input type="number" class="form-control" name="price" value="${cake.price}">
                                            </div>

                                        </div>
                                        <div class="form-row">

                                            <div class="form-group col-md-8">
                                                <div id="inputHeader">Chinese Name</div>
                                                <input type="text" class="form-control" name="namecn" value="${cake.namecn}">
                                            </div>


                                            <div class="form-group col-md-4">
                                                <div id="inputHeader">Size</div>
                                                <input type="number" class="form-control" name="size" value="${cake.size}">
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <div id="inputHeader">Cake Description</div>
                                                <textarea class="form-control" name="description" rows="3">${cake.description}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-12">
                                                <div id="inputHeader">Chinese Description</div>
                                                <textarea class="form-control" name="descriptioncn" rows="3">${cake.descriptioncn}</textarea>
                                            </div>
                                        </div>

                                        <div class="form-row text-md-right">
                                            <div class="form-check col-md-1">
                                            </div>
                                            <div class="form-check col-md-3">
                                                <div class="row">
                                                    <div id="inputHeader">Featured</div>
                                                    <input class="form-check-input" type="checkbox" class="form-control" <c:if test="${cake.featured==true}">checked</c:if> name="featured">
                                                    </div>
                                                </div>

                                                <div class="form-check col-md-3">
                                                    <div class="row">
                                                        <div id="inputHeader">Special</div>
                                                        <input class="form-check-input" type="checkbox" class="form-control" <c:if test="${cake.special==true}">checked</c:if> name="special">
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-5 text-md-right">
                                                    <button type="button submit" class="btn btn-success">Edit Cake</button>

                                                    <input type="hidden" name="selectedCakeId" value=${cake.cakeId}>

                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>            
                        </div>
                    </div>

                </div>
            </div>
    </body>
</html>
