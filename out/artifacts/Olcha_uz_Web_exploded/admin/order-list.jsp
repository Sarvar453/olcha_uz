<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
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
            flex-direction: column;
            padding: 0;
        }
        .container form{
            display: flex;
            flex-direction: column;
            padding-top: 15px;
            padding-left: 15px;
        }
        .top-row{
            margin-left: 10px;
            margin-top: 20px;
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
        .add-category{
            width: 130px !important;
            margin-top: 15px;
            margin-bottom: 10px;
        }
        .bottom-row{
            margin-right: 20px;
            margin-left: 10px;
            margin-top: 10px;

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
        .option-button{
            width: 40px;
            font-size: 14px;
        }
        .primary-footer{
            margin-top: 20px;
        }
        .modal-body{
            max-height: 550px;
            overflow-y: auto;
            --sb-track-color: #5a6268;
            --sb-thumb-color: #0069d9;
            --sb-size: 13px;
        }
        .modal-body::-webkit-scrollbar {
            width: var(--sb-size);
        }

        .modal-body::-webkit-scrollbar-track {
            background: var(--sb-track-color);
            border-radius: 3px;
        }
        .modal-body::-webkit-scrollbar-thumb {
            background: var(--sb-thumb-color);
            border-radius: 3px;
        }
        @supports not selector(::-webkit-scrollbar) {
            .modal-body {
                scrollbar-color: var(--sb-thumb-color) var(--sb-track-color);
            }
        }
        .container{
            max-height: 700px;
            overflow-y: auto;
            --sb-track-color: #5a6268;
            --sb-thumb-color: #0069d9;
            --sb-size: 13px;
        }
        .container::-webkit-scrollbar {
            width: var(--sb-size);
        }
        .container::-webkit-scrollbar-track {
            background: var(--sb-track-color);
            border-radius: 3px;
        }
        .container::-webkit-scrollbar-thumb {
            background: var(--sb-thumb-color);
            border-radius: 3px;
        }
        @supports not selector(::-webkit-scrollbar) {
            .container {
                scrollbar-color: var(--sb-thumb-color) var(--sb-track-color);
            }
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
        <button type="submit" class="btn btn-info add-order" data-toggle="modal" data-target="#addOrderModal" >Add order</button>
        <c:if test="${empty list}">
            <h3>No orders found.</h3>
        </c:if>

        <c:if test="${!empty list}">
            <table class="table table-bordered">
                <thead class="thead-dark">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">User ID</th>
                    <th scope="col">Status</th>
                    <th scope="col">PromoCode ID</th>
                    <th scope="col">Created date</th>
                    <th scope="col">Modified date</th>
                    <th scope="col">Created By</th>
                    <th scope="col">Modified By</th>
                    <th scope="col">Active</th>
                    <th scope="col">Permission</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="category">
                    <tr>
                        <th scope="row">${order.getId()}</th>
                        <td>${order.getUserId()}</td>
                        <td>${order.getStatus()}</td>
                        <td>${order.getCreated_at()}</td>
                        <td>${order.getModified_at()}</td>
                        <td>${order.getCreated_by()}</td>
                        <td>${order.getUpdated_by()}</td>
                        <td>${order.getAсtive()}</td>
                        <td>${order.getPermission()}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
<%--<!-- Order add Modal -->--%>
<%--<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryTitle" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title">Add order</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <form action="add-order" method="post">--%>
<%--                    <div class="form-group">--%>
<%--                        <label>Enter name of the order</label>--%>
<%--                        <input class="form-control" name="order_name" type="text" placeholder="Order name" required>--%>
<%--                    </div>--%>
<%--                    <div class="form-check">--%>
<%--                        <input class="form-check-input checkBox" type="checkbox" onchange="toggleCheckbox()">--%>
<%--                        <label class="form-check-label">Sub order</label>--%>
<%--                    </div>--%>
<%--                    <div class="form-group parentId" style="display: none">--%>
<%--                        <label>Enter order's product id</label>--%>
<%--                        <input class="form-control" name="parent_id" type="number" placeholder="Parent id">--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer primary-footer">--%>
<%--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                        <button type="submit" class="btn btn-primary">Add</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Delete Modal -->--%>
<%--<div class="modal fade" id="deleteOrderModal" tabindex="-1" role="dialog" aria-labelledby="deleteOrderTitle" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="deleteOrderTitle">Warning!</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <p>You really want to delete this order?<br>All products and suborders depending on this order also will be removed!</p>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                <form action="delete-category" method="post">--%>
<%--                    <input type="hidden" name="category_id" id="deleteCategoryId"/>--%>
<%--                    <button type="submit" class="btn btn-danger">Delete</button>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<!-- Update Modal -->--%>
<%--<div class="modal fade" id="updateOrderModal" tabindex="-1" role="dialog" aria-labelledby="updateOrderTitle" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="updateOrderTitle">Update order</h5>--%>
<%--                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                    <span aria-hidden="true">&times;</span>--%>
<%--                </button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                <form action="update-order" method="post" style="display:inline;">--%>
<%--                    <input type="hidden" name="category-id" id="updateCategoryId"/>--%>
<%--                    <div class="form-group">--%>
<%--                        <input type="text" name="category-name" id="updateCategoryName" class="form-control"/>--%>
<%--                    </div>--%>
<%--                    <div class="form-check">--%>
<%--                        <input class="form-check-input checkBox" type="checkbox" onchange="toggleCheckbox()">--%>
<%--                        <label class="form-check-label">Sub order</label>--%>
<%--                    </div>--%>
<%--                    <div class="form-group parentId" style="display: none">--%>
<%--                        <label>Enter order's product id</label>--%>
<%--                        <input class="form-control" name="product-id" id="updateOrderProductId" type="number">--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer primary-footer">--%>
<%--                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
<%--                        <button type="submit" class="btn btn-primary">Save</button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script src="../js/category-list.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>