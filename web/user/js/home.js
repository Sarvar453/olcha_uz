document.addEventListener('DOMContentLoaded', () => {
    getCategoryListByFetch().then(() => console.log("Parent categories rendered."));
});

async function getChildCategories(parentId) {
    const liDiv = document.getElementById(parentId);
    const url = `http://localhost:8080/api/category/list`;

    try {
        const res = await fetch(encodeURI(url));
        const categories = await res.json();

        const childCategories = categories.filter(category => category.parentId === parentId);

        if (childCategories.length > 0) {
            let existingChildUl = liDiv.querySelector("ul");
            if (!existingChildUl) {
                existingChildUl = document.createElement("ul");

                childCategories.forEach(category => {
                    const childLi = document.createElement("li");
                    childLi.id = category.id;
                    childLi.textContent = category.name;

                    childLi.addEventListener("mouseenter", (e) => {
                        e.stopPropagation();
                        getChildCategories(category.id);
                    });

                    childLi.addEventListener("click", (e) => {
                        e.stopPropagation();
                        console.log(`Clicked category: ${category.id}`); // Для отладки
                        loadProducts(category.id);
                    });

                    existingChildUl.appendChild(childLi);
                });

                liDiv.appendChild(existingChildUl);
            }
        }
    } catch (error) {
        console.error("Error occurred while fetching child categories:", error);
    }
}

async function getCategoryListByFetch() {
    const url = "http://localhost:8080/api/category/list";

    try {
        const res = await fetch(encodeURI(url));
        const categories = await res.json();
        renderParentCategories(categories);
    } catch (error) {
        console.error("Error occurred while fetching categories:", error);
    }
}

function renderParentCategories(categories) {
    const categoriesDiv = document.getElementById("categories");
    const ul = document.createElement("ul");

    categories
        .filter(category => category.parentId === 0)
        .forEach(category => {
            const li = document.createElement("li");
            li.id = category.id;
            li.textContent = category.name;

            // Наведение для отображения подкатегорий
            li.addEventListener("mouseenter", (e) => {
                e.stopPropagation();
                getChildCategories(category.id);
            });

            // Клик для показа продуктов
            li.addEventListener("click", (e) => {
                e.stopPropagation();
                console.log(`Clicked parent category: ${category.id}`); // Для отладки
                loadProducts(category.id);
            });

            ul.appendChild(li);
        });

    categoriesDiv.appendChild(ul);
}

async function loadProducts(categoryId) {
    const url = `http://localhost:8080/api/product/list?categoryId=${categoryId}`; // URL получения продуктов
    try {
        const res = await fetch(url);
        const products = await res.json();
        renderProducts(products);
    } catch (error) {
        console.error("Error loading products:", error);
    }
}

function renderProducts(products) {
    const productContainer = document.querySelector(".right-side .grid-container");
    productContainer.innerHTML = "";

    if (products.length === 0) {
        productContainer.innerHTML = "<p>No products found in this category.</p>";
        return;
    }

    products.forEach(product => {
        const productDiv = document.createElement("div");
        productDiv.classList.add("grid-item", "product");

        const imageUrl = product.images && product.images.length > 0
            ? `images/${product.images[0].name}`
            : "images/macbook.jpg";

        productDiv.innerHTML = `
        <img class="product-img" src="${imageUrl}" alt="${product.name}" width="300px">
        <p class="product-name">${product.name}</p>
        <p class="product-price">${product.price}$</p>
        <a class="product-link" href="#">View</a>
    `;

        productContainer.appendChild(productDiv);
    });
}
