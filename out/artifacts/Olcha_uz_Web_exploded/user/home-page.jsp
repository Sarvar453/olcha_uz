<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/14/2024
  Time: 10:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Olcha.uz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="plugins/fontawesome-free-6.6.0-web/css/all.css">
    <style>

        ul {
            background-color: #0069d9;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        ul li {
            height: 60px;
            width: 150px;
            line-height: 60px;
            color: white;
            display: flex;
            flex-direction: column;
            text-align: center;
            margin: 0;
            padding: 0;
            position: relative;
        }

        ul li:hover {
            background-color: yellow;
            transition: 0.3s all linear;
            color: red;
            cursor: pointer;
        }

        ul li > ul {
            position: absolute;
            z-index: 999;
            width: 100%;
            left: 100%;
            background-color: #6c757d;
        }

        li ul {
            display: none;
        }

        li:hover > ul {
            display: block;
        }

        ul li:first-child ul:first-child li ul {
            left: 100%;
            top: 0;
        }
        .grid-container{
            display: grid;
            grid-template-columns: auto auto auto;
            margin-left: 100px;
            gap: 25px !important;
        }

    </style>
</head>
<body>
<main>
    <div id="categories">

    </div>
    <div class="right-side">
        <div class="grid-container sub-container" id="product-section">

        </div>
    </div>
</main>
<script src="js/home.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
