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

    .add-product {
      width: 150px !important;
      margin: 15px 0 10px;
    }

    .bottom-row {
      margin: 10px 20px 0 10px;
    }

    .btn {
      width: 120px;
    }

    .update-button,
    .delete-button {
      font-size: 14px;
      width: 80px;
      border-radius: 5px;
    }

    .update-button {
      border-radius: 5px 0 0 5px;
    }

    .delete-button {
      border-radius: 0 5px 5px 0;
    }

    .option-button {
      width: 40px;
      font-size: 14px;
    }

    .modal-body {
      max-height: 550px;
      overflow-y: auto;
    }
    .form-container{
      display: flex;
      flex-direction: column;
    }

    .form-check-label {
      margin-bottom: 5px;
    }



    .modal-header {
      background-color: #f8f9fa;
      border-bottom: 1px solid #dee2e6;
    }
    .item-group {
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    .item-block{
      display: flex;
      flex-direction: row;
    }
    .item-group > div {
      display: flex;
      flex-direction: row;
      gap: 10px;
    }
    .color-btn{
      height: 40px;
    }
    .form-container {
      margin-bottom: 20px;
    }
    .modal-body {
      padding: 20px;
    }
    .modal-footer .btn-secondary {
      background-color: #6c757d;
    }
    .modal-footer .btn-danger {
      background-color: #dc3545;
    }
    .add-field{
      margin-top: 10px;
      width: 100%;
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
      <button type="submit" class="btn btn-info add-product" data-toggle="modal" data-target="#addProductModal"><c:if test="${userPermission != 'CREATE' && userPermission !='ALL'}">disabled</c:if>Add product</button>
      <c:if test="${empty list}">
        <h3>No products found.</h3>
      </c:if>
      <c:if test="${!empty list}">
        <table class="table">
          <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Price</th>
            <th scope="col">Discount</th>
            <th scope="col">From delivery</th>
            <th scope="col">To delivery</th>
            <th scope="col">Created at</th>
            <th scope="col">Modified at</th>
            <th scope="col">Created by</th>
            <th scope="col">Modified by</th>
            <th scope="col">action</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${list}" var="product">
            <tr>
              <th scope="row">${product.getId()}</th>
              <td>${product.getName()}</td>
              <td>${product.getPrice()}</td>
              <td>${product.getDiscount()}</td>
              <td>${product.getFromDelivery()}</td>
              <td>${product.getToDelivery()}</td>
              <td>${product.getCreatedAt()}</td>
              <td>${product.getModifiedAt()}</td>
              <td>${product.getCreatedBy()}</td>
              <td>${product.getCreatedBy()}</td>
              <td class="td-gap">
                <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateProductModal"
                        onclick="setUpdateProductParams('${product.getId()}', '${product.getName()}', '${product.getPrice()}','${product.getDescription()}','${product.getDiscount()}','${product.getFromDelivery()}','${product.getToDelivery()}')"><c:if test="${userPermission != 'UPDATE' && userPermission != 'ALL'}">disabled</c:if>
                  Update
                </button>
                <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteProductModal"
                        onclick="setDeleteProductId(${product.getId()})"><c:if test="${userPermission != 'DELETE' && userPermission != 'ALL'}">disabled</c:if>Delete</button>
                <button class="btn btn-success option-button" type="button" data-toggle="modal" data-target="#optionProductModal"
                        onclick="setOptionProductParams('${product.getId()}',
                                '${fn:escapeXml(product.getDescription())}',
                                '${fn:escapeXml(JSON.stringify(product.getImages()))}',
                                '${fn:escapeXml(JSON.stringify(product.getParams()))}',
                                '${fn:escapeXml(product.getColor())}')">
                  <i class="fa-solid fa-bars"></i>
                </button>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </c:if>
    </div>
</div>
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="addProductTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="add-product" method="post">
          <div class="form-group">
            <label class="form-check-label">Enter name</label>
            <input type="text" name="product-name" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter price</label>
            <input type="text" name="product-price" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter description</label>
            <textarea class="form-control" name="product-description" aria-label="With textarea"></textarea>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter discount</label>
            <input type="number" name="product-discount" class="form-control" min="0" max="100" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter from delivery</label>
            <input type="date" name="product-from_delivery" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter to delivery</label>
            <input type="date" name="product-to_delivery" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter category</label>
            <input type="hidden" name="category-id" id="categoryId"/>
            <select id="categorySelect" name="category" class="form-control" onclick="getCategoryListByFetch()">

            </select>
          </div>

          <!-- Image Section -->
          <div id="imageFormContainer" class="form-container">
            <div class="form-group">
              <label class="form-check-label">Add images</label>
              <div id="imageGroupContainer1" class="item-group">
                <div class="item-block">
                  <input type="text" class="image-input form-control" placeholder="Image name">
                  <input type="file" class="image-input form-control" accept="image/png, image/jpeg">
                  <button type="button" class="remove-field btn btn-danger"><i class="fa-solid fa-x"></i></button>
                </div>
              </div>
              <button type="button" class="btn btn-primary add-field" data-form-id="imageGroupContainer1" data-field-type="image"><i class="fa-solid fa-plus"></i></button>
              <input type="hidden" name="imageJsonData" id="imageJsonData1">
            </div>
          </div>
          <!-- Parameters Section -->
          <div id="paramFormContainer" class="form-container">
            <div class="form-group">
              <label class="form-check-label">Add parameters</label>
              <div id="paramGroupContainer1" class="item-group">
                <div class="item-block">
                  <input type="text" class="param-input form-control" placeholder="Parameter Name">
                  <input type="text" class="param-input form-control" placeholder="Parameter Value">
                  <button type="button" class="remove-field btn btn-danger"><i class="fa-solid fa-x"></i></button>
                </div>
              </div>
              <button type="button" class="btn btn-primary add-field" data-form-id="paramGroupContainer1" data-field-type="param"><i class="fa-solid fa-plus"></i></button>
              <input type="hidden" name="paramJsonData" id="paramJsonData1">
            </div>
          </div>
          <!-- Colors Section -->
          <div id="colorFormContainer" class="form-container">
            <div class="form-group">
              <label class="form-check-label">Select Colors</label>
              <div id="colorGroupContainer1" class="item-group">
                <div class="item-block">
                  <input type="text" class="color-input form-control" placeholder="Color Name">
                  <input type="color" class="color-input form-control  color-btn">
                  <button type="button" class="remove-field btn btn-danger"><i class="fa-solid fa-x"></i></button>
                </div>
              </div>
              <button type="button" class="btn btn-primary add-field" data-form-id="colorGroupContainer1" data-field-type="color"><i class="fa-solid fa-plus"></i></button>
              <input type="hidden" name="colorJsonData" id="colorJsonData1">
            </div>
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
<!-- Delete Modal -->
<div class="modal fade" id="deleteProductModal" tabindex="-1" role="dialog" aria-labelledby="deleteProductTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="deleteCategoryTitle">Warning!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>You really want to delete this product?</p>
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
<!-- Update Modal -->
<div class="modal fade" id="updateProductModal" tabindex="-1" role="dialog" aria-labelledby="updateProductTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateProductTitle">Update Product</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="update-product" method="post">
          <input type="hidden" name="product-id" id="updateProductId"/>
          <div class="form-group">
            <label>Enter new name</label>
            <input type="text" name="product-name" id="updateProductName" class="form-control"/>
          </div>
          <div class="form-group">
            <label>Enter new price</label>
            <input type="text" name="product-price" id="updateProductPrice" class="form-control"/>
          </div>
          <div class="form-group">
            <label>Enter new description</label>
            <input type="text" name="product-description" id="updateProductDescription" class="form-control"/>
          </div>
          <div class="form-group">
            <label>Enter new discount</label>
            <input type="number" name="product-discount" id="updateProductDiscount" class="form-control"/>
          </div>
          <div class="form-group">
            <label>Enter new from delivery</label>
            <input type="date" name="product-from_delivery" id="updateProductFromDelivery" class="form-control"/>
          </div>
          <div class="form-group">
            <label>Enter new to delivery</label>
            <input type="date" name="product-to_delivery" id="updateProductToDelivery" class="form-control"/>
          </div>
          <div class="modal-footer primary-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Save</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="optionProductModal" tabindex="-1" role="dialog" aria-labelledby="optionProductModalTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="optionProductModalTitle">Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="product_id" id="optionProductId"/>
        <p><strong>Description:</strong><br><span id="optionProductDescription"></span></p>
        <p><strong>Images:</strong><br><span id="optionProductImages"></span></p>
        <p><strong>Parameters:</strong><br><span id="optionProductParams"></span></p>
        <p><strong>Color:</strong><br><span id="optionProductColor"></span></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script src="js/product-list.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

