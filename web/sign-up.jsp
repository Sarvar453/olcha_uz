<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11/6/2024
  Time: 11:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
            align-items: center;
            justify-content: center;
        }
    </style>
</head>
<body>
<div class="registration_block">
    <p class="registration_block-title">Registration</p>
    <form method = "post" action = "sign-up">
        <div class="block-input">
            <div class="input-box">
                <input name = "create-username" type="text" placeholder = "Enter your username" required/>
            </div>
            <div class="input-box">
                <input name = "create-email" type="email" placeholder = "Enter your email" required/>
            </div>
            <div class="input-box">
                <input name = "create-password" type="password" placeholder = "Create password" required/>
            </div>
            <div class="input-box">
                <input name = "confirm-password" type="password" placeholder = "Confirm password" required/>
            </div>
            <div class="input-box button">
                <input type="submit" value="Register Now"/>
            </div>
            <div class="text">
                <p>Already have an account? <a href="/sign-in">Login now</a></p>
            </div>
        </div>
    </form>
</div>
</body>
</html>
