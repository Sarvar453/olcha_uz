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
    let categoryList = document.getElementById("button-section");
    let temp = "";
    categories.forEach(category => {
        let areThereSubCategories = false;
        temp += "<li class=\"category-item\">";
        temp += "<a class=\"section-category\" href=\"#\">"+category.name+"</a>";
        categories.forEach(subCategory => {
            if (subCategory.parentId === category.id) {
                areThereSubCategories = true;
            }
        });
        if (areThereSubCategories){
            temp += "<ul class=\"sub-category\">";
            categories.forEach(subCategory => {
               if(subCategory.parentId === category.id){
                   temp += "<li><a href='#'>" + subCategory.name + "</a></li>";
               }
            });
            temp += "</ul>";
        }
        temp+="</li>";
    });
    categoryList.innerHTML = temp;
}