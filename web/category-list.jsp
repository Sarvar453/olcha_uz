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
        <%--<button class="btn btn-primary" name="table-type" type="submit">Categories</button>--%>
      </div>
      <div class="form-group">
        <input class="btn btn-primary" name="table-type" type="submit" value="Products"/>
        <%--<button class="btn btn-primary" name="table-type" type="submit">Products</button>--%>
      </div>
      <div class="form-group">
        <input class="btn btn-primary" name="table-type" type="submit" value="Carts"/>
        <%--<button class="btn btn-primary" name="table-type" type="submit">Carts</button>--%>
      </div>
      <div class="form-group">
        <input class="btn btn-primary" name="table-type" type="submit" value="Orders"/>
        <%--<button class="btn btn-primary" name="table-type" type="submit">Orders</button>--%>
      </div>
    </form>
  </div>
  <div class="right-column">
    <button type="submit" class="btn btn-info add-category" data-toggle="modal" data-target="#addCategoryModal" >Add category</button>
    <c:if test="${empty list}">
      <h3>No categories found.</h3>
    </c:if>

    <c:if test="${!empty list}">
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
          <th scope="col">Active</th>
          <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="category">
          <tr>
            <th scope="row">${category.getId()}</th>
            <td>${category.getName()}</td>
            <td>${category.getParentId()}</td>
            <td>${category.getCreatedAt()}</td>
            <td>${category.getModifiedAt()}</td>
            <td>${category.getCreatedBy()}</td>
            <td>${category.getModifiedBy()}</td>
            <td>${category.getActive()}</td>
            <td class="td-gap">
              <button class="btn btn-primary update-button" type="button" data-toggle="modal" data-target="#updateCategoryModal"
                      onclick="setUpdateCategoryParams('${category.id}', '${category.name}', '${category.parentId}')"
                ${userPermission != 'UPDATE' && userPermission != 'ALL' ? '' : ''}>
                Update
              </button>
              <button class="btn btn-danger delete-button" type="button" data-toggle="modal" data-target="#deleteCategoryModal"
                      onclick="setDeleteCategoryId(${category.getId()})"
                ${userPermission != 'DELETE' && userPermission != 'ALL' ? 'disabled' : ''}>
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
<!-- Category add Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="add-category" method="post">
          <div class="form-group">
            <label>Enter name of the category</label>
            <input class="form-control" name="category_name" type="text" placeholder="Category name" required>
          </div>
          <div class="form-check">
            <input class="form-check-input checkBox" type="checkbox" onchange="toggleCheckbox()">
            <label class="form-check-label">Sub category</label>
          </div>
          <div class="form-group parentId" style="display: none">
            <label>Enter category's parent id</label>
            <input class="form-control" name="parent_id" type="number" placeholder="Parent id">
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
        <p>You really want to delete this category?<br>All products and subcategories depending on this category also will be removed!</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <form action="delete-category" method="post">
          <input type="hidden" name="category_id" id="deleteCategoryId"/>
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
        <form action="update-category" method="post" style="display:inline;">
          <input type="hidden" name="category-id" id="updateCategoryId"/>
          <div class="form-group">
            <input type="text" name="category-name" id="updateCategoryName" class="form-control"/>
          </div>
          <div class="form-check">
            <input class="form-check-input checkBox" type="checkbox" onchange="toggleCheckbox()">
            <label class="form-check-label">Sub category</label>
          </div>
          <div class="form-group parentId" style="display: none">
            <label>Enter category's parent id</label>
            <input class="form-control" name="parent-id" id="updateCategoryParentId" type="number">
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

<script src="js/category-list.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>