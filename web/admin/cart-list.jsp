<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.pdp.entity.Cart" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cart List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body{
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgb(28, 100, 171);
        }
        .container{
            max-width: 1450px;
            width: 100%;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
            height: 700px;
            display: flex;
            flex-direction: row;
            padding: 0;
        }
        .container form{
            display: flex;
            flex-direction: column;
            padding-top: 15px;
            padding-left: 15px;
        }
        .left-column{
            border-right: 1px solid black;
            width: 155px !important;
        }
        .right-column{
            margin-left: 40px;
            margin-top: 15px;
        }
        .btn{
            width: 120px;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="left-column">
            <a class="switch-button" href="category-list">Categories</a>
            <a class="switch-button" href="product-list">Products</a>
            <a class="switch-button" href="cart-list">Carts</a>
            <a class="switch-button" href="order-list">Orders</a>
        </div>
    <div class="right-column">
        <c:if test="${empty list}">
            <h3>No carts found.</h3>
        </c:if>

        <c:if test="${!empty list}">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">User</th>
                    <th scope="col">Username</th>
                    <th scope="col">Email</th>
                    <th scope="col">Product ID</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Created At</th>
                    <th scope="col">Modified At</th>
                    <th scope="col">Created By</th>
                    <th scope="col">Modified By</th>
                    <th scope="col">Active</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="cart">
                    <tr>
                        <th scope="row">${cart.getId()}</th>
                        <td>${cart.getUser().getUsername()}</td>
                        <td>${cart.getUser().getEmail()}</td>
                        <td>${cart.getUser().getName()}</td>
                        <td>${cart.getProductId()}</td>
                        <td>${cart.getQuantity()}</td>
                        <td>${cart.getCreatedAt()}</td>
                        <td>${cart.getModifiedAt()}</td>
                        <td>${cart.getCreatedBy()}</td>
                        <td>${cart.getModifiedBy()}</td>
                        <td>${cart.isActive()}</td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </c:if>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0jpJImVIn5QjKJ5rZ2I7sH37lg0HL90wnnM0jmj54FqKlzUy" crossorigin="anonymous"></script>

</body>
</html>
