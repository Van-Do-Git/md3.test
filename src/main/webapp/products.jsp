<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/8/2021
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/Products?action=create">
    <button>+Add new product</button>
</a>
<form method="post" action="/Products?action=search">
    <table>
        <tr>
            <td>
                <input name="name" value="" type="text" placeholder="Search">
            </td>
            <td>
                <button type="submit">Search</button>
            </td>
        </tr>
    </table>
</form>
<table class="table table-striped">
    <tr>
        <th>#</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Color</th>
        <th>Category</th>
        <th>Action</th>
    </tr>
    <c:forEach items="${products}" varStatus="loop" var="prd">
        <tr>
            <td>${loop.index}</td>
            <td>${prd.name}</td>
            <td>${prd.price}</td>
            <td>${prd.quantity}</td>
            <td>${prd.color}</td>
            <td>${prd.category}</td>
            <td>
                <a href="/Products?action=edit&id=${prd.id}">
                    <button>Sửa</button>
                </a>
                <a href="/Products?action=delete&id=${prd.id}">
                    <button>Xóa</button>
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
