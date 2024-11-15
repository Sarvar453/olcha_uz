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

async function getCategoryListByFetch() {
    const url = "http://localhost:8080/api/category/list";
    const encodedUrl = encodeURI(url);  // URLni to'g'ri kodlash
    try {
        const res = await fetch(encodedUrl);
        render(await res.json());
    } catch (error) {
        console.error("Xato yuz berdi:", error);
    }
}

function render(categoryList) {
    let categoryListDiv = document.getElementById("categoryList");
    let temp = "";
    for (let i = 0; i < categoryList.length; i++) {
        temp += "<tr>" +
            "<td>"+categoryList[i].id+"</td>" +
            "<td>"+categoryList[i].name+"</td>" +
            "<td>"+categoryList[i].parentId+"</td>" +
            "<td>"+categoryList[i].createdAt+"</td>" +
            "<td>"+categoryList[i].modifiedAt+"</td>" +
            "<td>"+categoryList[i].createdBy+"</td>" +
            "<td>"+categoryList[i].modifiedBy+"</td>" +
            "</tr>";
    }
    categoryListDiv.innerHTML = temp;
}