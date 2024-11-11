<!DOCTYPE html>
<html lang="en" xmlns:c="http://www.w3.org/1999/XSL/Transform">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <button type="button" class="btn btn-info add-category" data-toggle="modal" data-target="#addProductModal">Add Product</button>

    <c:if test="${empty productList}">
        <h3>Product List</h3>
    </c:if>

    <c:12forEach items="${productList}" var="product">
        <table class="table table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Name</th>
                <th scope="col">Category Id</th>
                <th scope="col">Price</th>
                <th scope="col">Status</th>
                <th scope="col">Created At</th>
                <th scope="col">Modified At</th>
                <th scope="col">Actions</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">${product.getId()}</th>
                <td>${product.getName()}</td>
                <td>${product.getCategoryId()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getStock()}</td>
                <td>${product.getCreatedAt()}</td>
                <td>${product.getModifiedAt()}</td>
                <td>
                    <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateProductModal"
                            onclick="setUpdateProductParams('${product.id}', '${product.name}', '${product.categoryId}', '${product.price}', '${product.stock}')">
                        Update
                    </button>
                    <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteProductModal" onclick="setDeleteProductId(${product.getId()})">Delete</button>
                </td>
            </tr>
            </tbody>
        </table>
    </c:12forEach>
</div>

<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="add-product" method="post">
                    <div class="form-group">
                        <label>Product Name</label>
                        <input class="form-control" name="product_name" type="text" required>
                    </div>
                    <div class="form-group">
                        <label>Category ID</label>
                        <input class="form-control" name="category_id" type="number" required>
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

<div class="modal fade" id="updateProductModal" tabindex="-1" role="dialog" aria-labelledby="updateProductTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Update Product</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="update-product" method="post">
                    <input type="hidden" name="product_id" id="updateProductId"/>
                    <div class="form-group">
                        <label>Product name</label>
                        <input class="form-control" name="product_name" id="updateProductName" type="text" required>
                    </div>
                    <div class="form-group">
                        <label>Category id</label>
                        <input class="form-control" name="category_id" id="updateProductCategoryId" type="number" required>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <input class="form-control" name="price" id="updateProductPrice" type="number" step="0.01" required>
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

<div class="modal fade" id="deleteProductModal" tabindex="-1" role="dialog" aria-labelledby="deleteProductTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Warning!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this product?</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <form action="delete-product" method="post">
                    <input type="hidden" name="product_id" id="deleteProductId"/>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function setDeleteProductId(productId) {
        document.getElementById('deleteProductId').value = productId;
    }

    function setUpdateProductParams(productId, productName, categoryId, price, stock) {
        document.getElementById('updateProductId').value = productId;
        document.getElementById('updateProductName').value = productName;
        document.getElementById('updateProductCategoryId').value = categoryId;
        document.getElementById('updateProductPrice').value = price;
        document.getElementById('updateProductStock').value = stock;
    }
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
