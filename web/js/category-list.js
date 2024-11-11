function toggleCheckbox() {
    const checkBoxes = document.querySelectorAll(".checkBox");
    const parentIds = document.querySelectorAll(".parentId");

    checkBoxes.forEach((checkBox, index) => {
        if (checkBox.checked) {
            parentIds[index].style.display = "block";
        } else {
            parentIds[index].style.display = "none";
        }
    });
}
function setDeleteCategoryId(categoryId) {
    document.getElementById('deleteCategoryId').value = categoryId;
}
function setUpdateCategoryParams(categoryId, categoryName, parentId) {
    document.getElementById('updateCategoryId').value = categoryId;
    document.getElementById('updateCategoryName').value = categoryName;
    const parentIdField = document.getElementById('updateCategoryParentId');
    if (parentId) {
        document.querySelector(".checkBox").checked = true;
        parentIdField.value = parentId;
        document.querySelector(".parentId").style.display = "block";
    } else {
        document.querySelector(".checkBox").checked = false;
        parentIdField.value = "";
        document.querySelector(".parentId").style.display = "none";
    }
}