<%-- 
    Document   : search
    Created on : Mar 17, 2019, 5:07:51 PM
    Author     : 775224
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <table>
             <c:forEach var="cake" items="${cakes}">
                        <tr>
                            <td><img src="<c:url value='${cake.image}'/>" alt="Cake Picture" width="50%" height="50%"/></td>
                            <td>${cake.cakeId}</td>
                            <td>${cake.name}</td>
                            <td>${cake.categoryId.description}</td>
                            <td>${cake.size}</td>
                            <td>${cake.price}</td>
                            <td>${cake.description}</td>
                            <td>${cake.featured}</td>
                            <td>${cake.special}</td>
                        </tr>
             </c:foreach>
        </table>
    </body>
</html>
