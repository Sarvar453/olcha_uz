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
        h3{
            margin-top: 15px;
            margin-left: 8px;
        }
        .container{
            width: 500px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
        }
        .container form{
            padding: 8px;
        }
        .form-group{
            margin-bottom: 8px;
        }
        .button{
            display: flex;
            justify-content: center;
            margin-top: 15px;
        }
        .btn{
            width: 120px;
        }
        .switch{
            display: flex;
            margin: auto;
            width: 210px;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>Registration</h3>
    <form action="sign-up" method="post">
        <div class="form-group">
            <label>Name/Username</label>
            <input class="form-control" name="name" type="text" placeholder="Enter your name" required>
        </div>
        <div class="form-group">
            <input class="form-control" name="name" type="text" placeholder="Enter your username" required>
        </div>
        <div class="form-group">
            <label>Phone number</label>
            <input class="form-control" name="phone-number" type="text" placeholder="Enter your phone number">
        </div>
        <div class="form-group">
            <label>Email</label>
            <input class="form-control" name="email" type="email" placeholder="Enter your email">
        </div>
        <div class="form-group">
            <label>Password</label>
            <input class="form-control" name="create-password" type="password" placeholder="Create password">
        </div>
        <div class="form-group">
            <input class="form-control" name="confirm-password" type="password" placeholder="Confirm password">
        </div>
        <div class="form-group select-option">
            <label>Choose role</label>
            <select name="role" class="form-select" id="role-select" onchange="togglePermissions()">
                <option value="USER" selected>User</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>
        <div class="form-group select-option" id="permission-container" style="display: none">
            <label>Choose permissions</label>
            <select name="permission" class="form-select" id="permission-select">
                <option value="ALL" selected>All</option>
                <option value="CREATE">Create</option>
                <option value="UPDATE">Update</option>
                <option value="DELETE">Delete</option>
            </select>
        </div>
        <div class="form-group button">
            <button class="btn btn-primary" type="submit">Next</button>
        </div>
        <div class="form-group switch">
            <p>Already registered?</p>
            <a href="/login"> Login</a>
        </div>
    </form>
</div>
<script>
    function togglePermissions() {
        const roleSelect = document.getElementById("role-select");
        const permissionsContainer = document.getElementById("permission-container");
        if (roleSelect.value === "ADMIN") {
            permissionsContainer.style.display = "block";
        } else {
            permissionsContainer.style.display = "none";
        }
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

