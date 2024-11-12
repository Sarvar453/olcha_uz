<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
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
            margin-left: 10px;
        }
        .container{
            width: 500px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.2);
        }
        .container form{
            padding: 10px;
        }
        .row input{
            width: 100%;
            padding: 10px;
        }
        .button{
            display: flex;
            justify-content: center;
        }
        .btn{
            width: 120px;
        }
        .switch{
            display: flex;
            margin: auto;
            width: 300px;
            justify-content: space-between;
        }
    </style>
</head>
<body>
<div class="container">
    <h3>Login</h3>
    <form action="login" method="post">
        <div class="form-group">
            <label>Username</label>
            <input class="form-control" name="username" type="text" placeholder="Enter your username" required>
        </div>

        <div class="form-group">
            <label>Password</label>
            <input class="form-control" name="password" type="password" placeholder="Enter your password">
        </div>

        <div class="form-group button">
            <button class="btn btn-primary" type="submit" >Next</button>
        </div>
        <div class="form-group switch">
            <p>You don't have an account?</p>
            <a href="/sign-up"> Sign-up</a>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>