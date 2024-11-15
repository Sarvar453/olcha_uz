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
function setDeleteOrderId(orderId) {
    document.getElementById('deleteOrderId').value = orderId;
}
function setUpdateOrderParams(orderId, productId, quantity) {
    document.getElementById('updateOrderId').value = orderId;
    document.getElementById('updateQuantity').value = quantity;
    const productIdField = document.getElementById('updateOrderProductId');
    if (productId) {
        document.querySelector(".checkBox").checked = true;
        productIdField.value = productId;
        document.querySelector(".productId").style.display = "block";
    } else {
        document.querySelector(".checkBox").checked = false;
        productIdField.value = "";
        document.querySelector(".productId").style.display = "none";
    }
}