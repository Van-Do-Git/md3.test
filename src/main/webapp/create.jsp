<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/8/2021
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/Products" method="post">
    <input name="name" placeholder="name">
    <input name="price" placeholder="price" type="number">
    <input name="quantity" placeholder="quantity" type="number">
    <input name="color" placeholder="color">
    <input name="description" placeholder="description">
    <select name="category">
        <c:forEach items="${category}" var="cate">
            <option value="${cate}"></option>
        </c:forEach>
    </select>
</form>
</body>
</html>
