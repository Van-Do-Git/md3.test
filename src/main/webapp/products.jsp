<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/8/2021
  Time: 9:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
<table>
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
            <td>#</td>
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
