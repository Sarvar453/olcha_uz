<%--
  Created by IntelliJ IDEA.
  User: rakhimovabdulaziz
  Date: 07/11/24
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
        .add-user{
            margin-top: 15px;
            margin-bottom: 10px;
        }
        .right-column{
            margin-left: 40px;
        }
        .btn{
            width: 120px;
        }
        .update-button{
            font-size: 14px;
            width: 80px;
            border-radius: 5px 0px 0px 5px;
        }
        .delete-button{
            font-size: 14px;
            width: 80px;
            border-radius: 0px 5px 5px 0px;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="left-column">
        <form method="post" action="some-action">
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Categories</button>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Products</button>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Carts</button>
            </div>
            <div class="form-group">
                <button class="btn btn-primary" type="submit">Orders</button>
            </div>
        </form>
    </div>
    <div class="right-column">
        <button type="submit" class="btn btn-info add-user">Add user</button>
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Parent ID</th>
                <th scope="col">Created at</th>
                <th scope="col">Modified at</th>
                <th scope="col">Created by</th>
                <th scope="col">Modified by</th>
                <th scope="col">active</th>
                <th scope="col">action</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Kitchen</td>
                <td></td>
                <td>2024-10-16 13:16:15.952637</td>
                <td></td>
                <td>postgres</td>
                <td></td>
                <td>true</td>
                <td class="td-gap">
                    <button class="btn btn-primary update-button">Update</button>
                    <button class="btn btn-danger delete-button">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

