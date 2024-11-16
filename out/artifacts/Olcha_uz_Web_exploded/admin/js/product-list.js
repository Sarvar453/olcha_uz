function setDeleteProductId(productId) {
    document.getElementById('deleteProductId').value = productId;
}

function setUpdateProductParams(productId, productName, productPrice, productDescription, productDiscount, productFromDelivery, productToDelivery) {
    document.getElementById('updateProductId').value = productId;
    document.getElementById('updateProductName').value = productName;
    document.getElementById('updateProductPrice').value = productPrice;
    document.getElementById('updateProductDescription').value = productDescription;
    document.getElementById('updateProductDiscount').value = productDiscount;
    document.getElementById('updateProductFromDelivery').value = productFromDelivery;
    document.getElementById('updateProductToDelivery').value = productToDelivery;
}

function setOptionProductParams(productId, productDescription, productImages, productParams, productColor) {
    document.getElementById('optionProductId').value = productId;
    document.getElementById('optionProductDescription').innerText = productDescription;

    /*document.getElementById('optionProductImage').innerText = productImages;*/
    document.getElementById('optionProductParams').innerText = productParams;

    document.getElementById('optionProductColor').innerText = productColor;
}


function formatJsonAsList(jsonArray) {
    if (Array.isArray(jsonArray)) {
        let listHtml = "<ul>";
        jsonArray.forEach(item => {
            listHtml += `<li><strong>Name:</strong> ${item.name}, <strong>URL:</strong> ${item.url}</li>`;
        });
        listHtml += "</ul>";
        return listHtml;
    }
    return "<p>Invalid JSON format</p>";
}

async function getCategoryListByFetch() {
    const url = "http://localhost:8080/api/category/list";
    const encodedUrl = encodeURI(url);
    try {
        const res = await fetch(encodedUrl);
        render(await res.json());
    } catch (error) {
        console.error("Error occurred", error);
    }
}
/*async function getProductListByFetch(){
    const url = "http://localhost:8080/api/product/list"
    const encodedUrl = encodeURI(url);
    try {
        const res = await fetch(encodedUrl);
        category_render(await res.json());
    } catch (error) {
        console.error("Error occurred", error);
    }
}
function product_render(){
    let productId = document.getElementById("optionProductId");
    let productDescription = document.getElementById("optionProductDescription");
    let productImages = document.getElementById("optionProductImages");
    let productParams = document.getElementById("optionProductParams");
    let productColor = document.getElementById("optionProductColor");

}*/
function formatImages(images) {
    if (Array.isArray(images)) {
        let html = "<ul>";
        images.forEach(image => {
            html += `<li><strong>Name:</strong> ${image.name}, <strong>URL:</strong> <a href="${image.url}" target="_blank">${image.url}</a></li>`;
        });
        html += "</ul>";
        return html;
    }
    return "<p>No images available.</p>";
}

function formatParams(params) {
    if (Array.isArray(params)) {
        let html = "<ul>";
        params.forEach(param => {
            html += `<li><strong>${param.name}:</strong> ${param.value}</li>`;
        });
        html += "</ul>";
        return html;
    }
    return "<p>No parameters available.</p>";
}
function render(categoryList) {
    let categorySelect = document.getElementById("categorySelect");

    const selectedValue = categorySelect.value;

    let options = "";
    for (let i = 0; i < categoryList.length; i++) {
        options += `<option value="${categoryList[i].id}" ${categoryList[i].id === selectedValue ? 'selected' : ''}>
                       ${categoryList[i].name}
                    </option>`;
    }

    categorySelect.innerHTML = options;

    categorySelect.value = selectedValue;
}
document.getElementById("categorySelect").addEventListener("change", function() {
    const selectedCategoryId = this.value;

    document.getElementById("categoryId").value = selectedCategoryId;
});





function populateFields(containerId, jsonData, type) {
    const container = document.getElementById(containerId);
    container.innerHTML = '';
    const data = JSON.parse(jsonData);
    data.forEach(item => {
        const div = document.createElement('div');
        div.className = 'item-group';

        if (type === 'image') {
            div.innerHTML = `
                <input type="text" class="image-input form-control" placeholder="Name" value="${item.name}">
                <input type="file" class="image-input form-control" value="${item.url}">
            `;
        } else if (type === 'param') {
            div.innerHTML = `
                <input type="text" class="param-input form-control" placeholder="Parameter Name" value="${item.name}">
                <input type="text" class="param-input form-control" placeholder="Parameter Value" value="${item.value}">
            `;
        } else if (type === 'color') {
            div.innerHTML = `
                <input type="text" class="color-input form-control" placeholder="Color Name" value="${item.name}">
                <input type="color" class="color-input form-control color-btn" value="${item.hex}">
            `;
        }

        div.innerHTML += `<button type="button" class="remove-field btn btn-danger" onclick="this.parentElement.remove(); updateJsonData('${type}')">-</button>`;
        container.appendChild(div);
    });
}



/*function collectImages() {
    let images = [];
    document.querySelectorAll('#imageGroupContainer .item-group').forEach(group => {
        images.push({
            name: group.querySelector('.image-input[placeholder="Name"]').value,
            url: group.querySelector('.image-input[placeholder="URL"]').value
        });
    });
    return images;
}

function collectParameters() {
    let params = [];
    document.querySelectorAll('#paramGroupContainer .item-group').forEach(group => {
        params.push({
            name: group.querySelector('.param-input[placeholder="Parameter Name"]').value,
            value: group.querySelector('.param-input[placeholder="Parameter Value"]').value
        });
    });
    return params;
}

function collectColors() {
    let colors = [];
    document.querySelectorAll('#colorGroupContainer .item-group').forEach(group => {
        colors.push({
            name: group.querySelector('.color-input[placeholder="Color Name"]').value,
            hex: group.querySelector('input[type="color"]').value
        });
    });
    return colors;
}*/

function updateJsonData(type) {
    let dataArray = [];

    if (type === 'image') {
        dataArray = collectImages();
        document.getElementById('imageJsonData').value = JSON.stringify(dataArray);
    } else if (type === 'param') {
        dataArray = collectParameters();
        document.getElementById('paramJsonData').value = JSON.stringify(dataArray);
    } else if (type === 'color') {
        dataArray = collectColors();
        document.getElementById('colorJsonData').value = JSON.stringify(dataArray);
    }
}

document.addEventListener('DOMContentLoaded', function () {
    function collectFormData() {
        let formData = {
            name: document.querySelector('input[name="product-name"]').value,
            price: document.querySelector('input[name="product-price"]').value,
            description: document.querySelector('textarea[name="product-description"]').value,
            discount: document.querySelector('input[name="product-discount"]').value,
            from_delivery: document.querySelector('input[name="product-from_delivery"]').value,
            to_delivery: document.querySelector('input[name="product-to_delivery"]').value,
            images: collectImages(),
            parameters: collectParameters(),
            colors: collectColors()
        };
        return formData;
    }
    function collectImages() {
        let images = [];
        document.querySelectorAll('#imageGroupContainer1 .image-input').forEach((input, index) => {
            if (index % 2 === 0) {
                images.push({
                    name: input.value,
                    url: document.querySelectorAll('#imageGroupContainer1 .image-input')[index + 1].value
                });
            }
        });
        return images;
    }
    function collectParameters() {
        let params = [];
        document.querySelectorAll('#paramGroupContainer1 .param-input').forEach((input, index) => {
            if (index % 2 === 0) {
                params.push({
                    name: input.value,
                    value: document.querySelectorAll('#paramGroupContainer1 .param-input')[index + 1].value
                });
            }
        });
        return params;
    }
    function collectColors() {
        let colors = [];
        document.querySelectorAll('#colorGroupContainer1 .color-input').forEach((input, index) => {
            if (index % 2 === 0) {
                colors.push({
                    name: input.value,
                    color: document.querySelectorAll('#colorGroupContainer1 .color-input')[index + 1].value
                });
            }
        });
        return colors;
    }
    function addField(containerId, type) {
        const container = document.getElementById(containerId);
        let newFieldHTML = '';

        if (type === 'image') {
            newFieldHTML = `
                <input type="text" class="image-input form-control" placeholder="Name">
                <input type="file" class="image-input form-control" accept="image/png, image/jpeg">
                <button type="button" class="remove-param btn btn-danger"><i class="fa-solid fa-x"></i></button>
            `;
        } else if (type === 'param') {
            newFieldHTML = `
                <input type="text" class="param-input form-control" placeholder="Parameter Name">
                <input type="text" class="param-input form-control" placeholder="Parameter Value">
                <button type="button" class="remove-param btn btn-danger"><i class="fa-solid fa-x"></i></button>
            `;
        } else if (type === 'color') {
            newFieldHTML = `
                <input type="text" class="param-input form-control" placeholder="Color Name">
                <input type="color" class="color-input form-control">
                <button type="button" class="remove-param btn btn-danger"><i class="fa-solid fa-x"></i></button>
            `;
        }

        const newElement = document.createElement('div');
        newElement.classList.add('item-group');
        newElement.innerHTML = newFieldHTML;
        container.appendChild(newElement);

        const removeButton = newElement.querySelector('.remove-param');
        removeButton.addEventListener('click', function () {
            container.removeChild(newElement);
        });
    }

    document.querySelectorAll('.add-field').forEach(button => {
        button.addEventListener('click', function () {
            const containerId = this.getAttribute('data-form-id');
            const type = this.getAttribute('data-field-type');
            addField(containerId, type);
        });
    });

    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault();
        let formData = collectFormData();
        document.getElementById('imageJsonData1').value = JSON.stringify(formData.images);
        document.getElementById('paramJsonData1').value = JSON.stringify(formData.parameters);
        document.getElementById('colorJsonData1').value = JSON.stringify(formData.colors);
        this.submit();
    });
});

