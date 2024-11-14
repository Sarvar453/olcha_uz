<%--
  Created by IntelliJ IDEA.
  User: rakhimovabdulaziz
  Date: 07/11/24
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="plugins/fontawesome-free-6.6.0-web/css/all.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgb(28, 100, 171);
        }

        .container {
            max-width: 1450px;
            width: 100%;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            height: 700px;
            display: flex;
            flex-direction: column;
            padding: 0;
            overflow-y: auto;
            overflow-x: auto;
        }

        .container::-webkit-scrollbar {
            width: 13px;
        }

        .container::-webkit-scrollbar-track {
            background: #5a6268;
            border-radius: 3px;
        }

        .container::-webkit-scrollbar-thumb {
            background: #0069d9;
            border-radius: 3px;
        }

        .top-row {
            margin: 20px 10px 0;
        }

        .switch-button{
            color: #fff;
            padding: 10px;
            background: #0273e9;
            border-radius: 5px;
        }
        .switch-button:hover{
            text-decoration: none;
            color: #fff;
            background: #0069d9;
        }
        .bottom-row {
            margin: 10px 20px 0 10px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="top-row">
        <a class="switch-button" href="category-list">Categories</a>
        <a class="switch-button" href="product-list">Products</a>
        <a class="switch-button" href="cart-list">Carts</a>
        <a class="switch-button" href="order-list">Orders</a>
    </div>
    <div class="bottom-row">
        <c:if test="${empty list}">
            <h3>No products found.</h3>
        </c:if>
        <c:if test="${!empty list}">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">User id</th>
                    <th scope="col">Product id</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Created at</th>
                    <th scope="col">Modified at</th>
                    <th scope="col">Created by</th>
                    <th scope="col">Modified by</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="cart">
                    <tr>
                        <th scope="row">${cart.getId()}</th>
                        <td>${cart.getUser_id()}</td>
                        <td>${cart.getProduct_id()}</td>
                        <td>${cart.getCreatedAt()}</td>
                        <td>${cart.getModifiedAt()}</td>
                        <td>${cart.getCreatedBy()}</td>
                        <td>${cart.getModifiedBy()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

