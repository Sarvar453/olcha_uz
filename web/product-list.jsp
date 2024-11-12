<%--
  Created by IntelliJ IDEA.
  User: rakhimovabdulaziz
  Date: 07/11/24
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    .add-category{
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
        <input class="btn btn-primary" name="table-type" type="submit" value="Carts"/></div>
      <div class="form-group">
        <input class="btn btn-primary" name="table-type" type="submit" value="Orders"/>
      </div>
    </form>
  </div>
  <div class="right-column">
    <button type="submit" class="btn btn-info add-category" data-toggle="modal" data-target="#addCategoryModal" <c:if test="${userPermission != 'CREATE' && userPermission !='ALL'}">disabled</c:if>>Add product</button>
    <c:if test="${empty list}">
      <h3>No products found.</h3>
    </c:if>

    <c:if test="${!empty list}">
      <table class="table table-bordered">
        <thead class="thead-dark">
        <tr>
          <th scope="col">ID</th>
          <th scope="col">Name</th>
          <th scope="col">Price</th>
          <th scope="col">Description</th>
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
            <td>${product.getDescription()}</td>
            <td>${product.getDiscount()}</td>
            <td>${product.getFromDelivery()}</td>
            <td>${product.getToDelivery()}</td>
            <td>${product.getCreatedAt()}</td>
            <td>${product.getModifiedAt()}</td>
            <td>${product.getCreatedBy()}</td>
            <td>${product.getModifiedBy()}</td>
            <td class="td-gap">
              <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateCategoryModal"
                      onclick="setUpdateProductParams('${product.getId}', '${product.getName}', '${product.getPrice}','${product.getDescription}','${product.getDiscount}','${product.getFromDelivery}','${product.getToDelivery}')" <c:if test="${userPermission != 'UPDATE' && userPermission != 'ALL'}">disabled</c:if>>
                Update
              </button>
              <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteCategoryModal" onclick="setDeleteProductId(${product.getId()})" <c:if test="${userPermission != 'DELETE' && userPermission != 'ALL'}">disabled</c:if>>Delete</button>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </c:if>
  </div>
</div>
<!-- Product add Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryTitle" aria-hidden="true">
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
            <input type="text" name="product-description" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter discount</label>
            <input type="number" name="product-discount" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter from delivery</label>
            <input type="text" name="product-from_delivery" class="form-control" required/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter to delivery</label>
            <input type="text" name="product-to_delivery" class="form-control" required/>
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
<div class="modal fade" id="deleteCategoryModal" tabindex="-1" role="dialog" aria-labelledby="deleteCategoryTitle" aria-hidden="true">
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
<div class="modal fade" id="updateCategoryModal" tabindex="-1" role="dialog" aria-labelledby="updateCategoryTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="updateCategoryTitle">Update category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="update-product" method="post" style="display:inline;">
          <input type="hidden" name="category-id" id="updateCategoryId"/>
          <div class="form-group">
            <label class="form-check-label">Enter new name</label>
            <input type="text" name="product-name" id="updateProductName" class="form-control"/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter new price</label>
            <input type="text" name="product-price" id="updateProductPrice" class="form-control"/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter new description</label>
            <input type="text" name="product-description" id="updateProductDescription" class="form-control"/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter new discount</label>
            <input type="number" name="product-discount" id="updateProductDiscount" class="form-control"/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter new from delivery</label>
            <input type="text" name="product-from_delivery" id="updateProductFromDelivery" class="form-control"/>
          </div>
          <div class="form-group">
            <label class="form-check-label">Enter new to delivery</label>
            <input type="text" name="product-to_delivery" id="updateProductToDelivery" class="form-control"/>
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

<script src="js/product-list.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

