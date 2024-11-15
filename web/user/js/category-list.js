async function getCategoryListByFetch() {
    const url = "http://localhost:8080/api/category/list";
    const encodedUrl = encodeURI(url);
    try {
        const res = await fetch(encodedUrl);
        option_render(await res.json());
    } catch (error) {
        console.error("Error occurred", error);
    }
}
function option_render(categoryList) {
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
function render(categoryList) {
    let categoryListDiv = document.getElementById("categoryList");
    let temp = "";
    for (let i = 0; i < categoryList.length; i++) {
        temp += "<li>" +
            "<a>"+categoryList[i].id+"</a>" +
            "</li>";
    }
    categoryListDiv.innerHTML = temp;
}