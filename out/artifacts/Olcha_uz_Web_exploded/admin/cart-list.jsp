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
        .add-cart{
            width: 130px !important;
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
        .form-check{
            margin-left: 5px;
        }
        .parentId{
            margin-top: 15px;
        }
        .primary-footer{
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-column">
        <form method="post" action="switch">
            <div class="form-group">
                <input class="btn btn-primary" name="table-type" type="submit" value="Categories"/>
            </div>
            <div class="form-group">
                <input class="btn btn-primary" name="table-type" type="submit" value="Products"/>
            </div>
            <div class="form-group">
                <input class="btn btn-primary" name="table-type" type="submit" value="Carts"/>
            </div>
            <div class="form-group">
                <input class="btn btn-primary" name="table-type" type="submit" value="Orders"/>
            </div>
        </form>
    </div>
    <div class="right-column">
        <button type="submit" class="btn btn-info add-cart" data-toggle="modal" data-target="#addCartModal">Add Cart</button>
        <c:if test="${empty list}">
            <h3>No carts found.</h3>
        </c:if>

        <c:if test="${!empty list}">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">User ID</th>
                    <th scope="col">Product ID</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Created At</th>
                    <th scope="col">Modified At</th>
                    <th scope="col">Created By</th>
                    <th scope="col">Modified By</th>
                    <th scope="col">Active</th>
                    <th scope="col">Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="cart">
                    <tr>
                        <th scope="row">${cart.getId()}</th>
                        <td>${cart.getUserId()}</td>
                        <td>${cart.getProductId()}</td>
                        <td>${cart.getQuantity()}</td>
                        <td>${cart.getCreatedAt()}</td>
                        <td>${cart.getModifiedAt()}</td>
                        <td>${cart.getCreatedBy()}</td>
                        <td>${cart.getModifiedBy()}</td>
                        <td>${cart.getActive()}</td>
                        <td class="td-gap">
                            <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateCartModal"
                                    onclick="setUpdateCartParams('${cart.id}', '${cart.userId}', '${cart.productId}', '${cart.quantity}')">
                                Update
                            </button>
                            <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteCartModal"
                                    onclick="setDeleteCartId(${cart.getId()})">
                                Delete
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<div class="modal fade" id="addCartModal" tabindex="-1" role="dialog" aria-labelledby="addCartTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="add-cart" method="post">
                    <div class="form-group">
                        <label>Enter User ID</label>
                        <input class="form-control" name="user_id" type="number" placeholder="User ID" required>
                    </div>
                    <div class="form-group">
                        <label>Enter Product ID</label>
                        <input class="form-control" name="product_id" type="number" placeholder="Product ID" required>
                    </div>
                    <div class="form-group">
                        <label>Enter Quantity</label>
                        <input class="form-control" name="quantity" type="number" placeholder="Quantity" required>
                    </div>
                    <div class="modal-footer primary-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="deleteCartModal" tabindex="-1" role="dialog" aria-labelledby="deleteCartTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Warning!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this cart? All items in this cart will also be deleted.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="delete-cart" method="post">
                    <input type="hidden" name="cart_id" id="deleteCartId"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="updateCartModal" tabindex="-1" role="dialog" aria-labelledby="updateCartTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="update-cart" method="post">
                    <input type="hidden" name="id" id="updateCartId"/>
                    <div class="form-group">
                        <label>Enter User ID</label>
                        <input class="form-control" name="user_id" id="updateUserId" type="number" required>
                    </div>
                    <div class="form-group">
                        <label>Enter Product ID</label>
                        <input class="form-control" name="product_id" id="updateProductId" type="number" required>
                    </div>
                    <div class="form-group">
                        <label>Enter Quantity</label>
                        <input class="form-control" name="quantity" id="updateQuantity" type="number" required>
                    </div>
                    <div class="modal-footer primary-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0jpJImVIn5QjKJ5rZ2I7sH37lg0HL90wnnM0jmj54FqKlzUy" crossorigin="anonymous"></script>

<script>
    function setDeleteCartId(cartId) {
        document.getElementById('deleteCartId').value = cartId;
    }

    function setUpdateCartParams(id, userId, productId, quantity) {
        document.getElementById('updateCartId').value = id;
        document.getElementById('updateUserId').value = userId;
        document.getElementById('updateProductId').value = productId;
        document.getElementById('updateQuantity').value = quantity;
    }
</script>

</body>
</html>
