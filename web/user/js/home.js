document.addEventListener('DOMContentLoaded', (event) => {
    getCategoryListByFetch();
});

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

function render(categories) {
    let categoryListDiv = document.getElementById("button-section");
    let temp = "";
    categories.forEach(category => {
        temp += "<li class='category-item'>";
        temp += "<a href='#'>" + category.name + "</a>";

        if (category.subcategories && category.subcategories.length > 0) {
            temp += "<ul class='sub-category'>";
            category.subcategories.forEach(subcategory => {
                temp += "<li>";
                temp += "<a href='#'>" + subcategory.name + "</a>";

                if (subcategory.subcategories && subcategory.subcategories.length > 0) {
                    temp += "<ul class='sub-category'>";
                    subcategory.subcategories.forEach(subSubcategory => {
                        temp += "<li><a href='#'>" + subSubcategory.name + "</a></li>";
                    });
                    temp += "</ul>";
                }

                temp += "</li>";
            });
            temp += "</ul>";
        }

        temp += "</li>";
    });
    categoryListDiv.innerHTML = temp;
}
