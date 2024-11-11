<!DOCTYPE html>
<html lang="en" xmlns:c="https://jakarta.ee/xml/ns/jakartaee">
<head>
    <meta charset="UTF-8">
    <title>Order List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h3>Order List</h3>
    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#addOrderModal">Add Order</button>

    <c:if test="${empty orderList}">
        <p>No orders available</p>
    </c:if>

    <c:forEach items="${orderList}" var="order">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Customer Name</th>
                <th scope="col">Product ID</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Status</th>
                <th scope="col">Created Date</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">${order.getId()}</th>
                <td>${order.getCustomerName()}</td>
                <td>${order.getProductId()}</td>
                <td>${order.getQuantity()}</td>
                <td>${order.getPrice()}</td>
                <td>${order.getStatus()}</td>
                <td>${order.getOrderDate()}</td>
                <td>
                    <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateOrderModal"
                            onclick="setUpdateOrderParams('${order.id}', '${order.customerName}', '${order.productId}', '${order.quantity}', '${order.price}', '${order.status}')">
                        Update
                    </button>
                    <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteOrderModal" onclick="setDeleteOrderId(${order.getId()})">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </c:forEach>
</div>

<!-- Order Update Modal -->
<div class="modal fade" id="updateOrderModal" tabindex="-1" role="dialog" aria-labelledby="updateOrderTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="update-order" method="post">
                    <input type="hidden" name="order_id" id="updateOrderId"/>
                    <div class="form-group">
                        <label>Customer Name</label>
                        <input class="form-control" name="customer_name" id="updateCustomerName" type="text" required>
                    </div>
                    <div class="form-group">
                        <label>Order Date</label>
                        <input class="form-control" name="order_date" id="updateOrderDate" type="date" required>
                    </div>
                    <div class="form-group">
                        <label>Total Amount</label>
                        <input class="form-control" name="total_amount" id="updateTotalAmount" type="number" step="0.01" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Order Delete Modal -->
<div class="modal fade" id="deleteOrderModal" tabindex="-1" role="dialog" aria-labelledby="deleteOrderTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Warning!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this order?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="delete-order" method="post">
                    <input type="hidden" name="order_id" id="deleteOrderId"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addOrderModal" tabindex="-1" role="dialog" aria-labelledby="addOrderTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="add-order" method="post">
                    <div class="form-group">
                        <label>Customer Name</label>
                        <input class="form-control" name="customer_name" type="text" required>
                    </div>
                    <div class="form-group">
                        <label>Product ID</label>
                        <input class="form-control" name="product_id" type="number" required>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <input class="form-control" name="quantity" type="number" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input class="form-control" name="price" type="number" step="0.01" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setDeleteOrderId(orderId) {
        document.getElementById('deleteOrderId').value = orderId;
    }

    function setUpdateOrderParams(orderId, customerName, productId, quantity, price, status) {
        document.getElementById('updateOrderId').value = orderId;
        document.getElementById('updateCustomerName').value = customerName;
        document.getElementById('updateProductId').value = productId;
        document.getElementById('updateQuantity').value = quantity;
        document.getElementById('updatePrice').value = price;
        document.getElementById('updateStatus').value = status;
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
