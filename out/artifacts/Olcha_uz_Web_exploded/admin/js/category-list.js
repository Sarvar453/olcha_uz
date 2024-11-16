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
    const encodedUrl = encodeURI(url);
    try {
        const res = await fetch(encodedUrl);
        render(await res.json());
    } catch (error) {
        console.error("Error occurred:", error);
    }
}

function render(categoryList) {
    let categorySelect = document.getElementById("categorySelect");
    let parentId = document.getElementById("categoryId");
    const selectedValue = categorySelect.value;
    let options = "";
    for (let i = 0; i < categoryList.length; i++) {
        options += `<option value="${categoryList[i].id}" ${categoryList[i].id === selectedValue ? 'selected' : ''}>
                       ${categoryList[i].name}
                    </option>`;
    }
    categorySelect.innerHTML = options;
    categorySelect.value = selectedValue;
    parentId.value = selectedValue;
    console.log(parentId.value);
}
categorySelect.addEventListener("change", function () {
    parentId.value = categorySelect.value;
});