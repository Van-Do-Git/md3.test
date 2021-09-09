<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/8/2021
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
</head>
<body>
<form action="/Products?action=edit" method="post">
    <input name="id" type="hidden" value="${product.id}">
    <input name="name" placeholder="name" value="${product.name}">
    <input name="price" placeholder="price" type="number" value="${product.price}">
    <input name="quantity" placeholder="quantity" type="number" value="${product.quantity}">
    <input name="color" placeholder="color" value="${product.color}">
    <input name="description" placeholder="description" value="${product.description}">
    <select name="category">
        <c:forEach items="${category}" var="cate">
            <option value="${cate}">${cate}</option>
        </c:forEach>
    </select>
    <button>Ok</button>
</form>
</body>
</html>
