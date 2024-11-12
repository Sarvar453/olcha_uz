function setDeleteProductId(productId) {
    document.getElementById('deleteProductId').value = productId;
}
function setUpdateProductParams(productId, productName, productPrice, productDescription,productDiscount,productFromDelivery,productToDelivery) {
    document.getElementById('updateProductId').value = productId;
    document.getElementById('updateProductName').value = productName;
    document.getElementById('updateProductPrice').value = productPrice;
    document.getElementById('updateProductDescription').value = productDescription;
    document.getElementById('updateProductDiscount').value = productDiscount;
    document.getElementById('updateProductFromDelivery').value = productFromDelivery;
    document.getElementById('updateProductToDelivery').value = productToDelivery;
}