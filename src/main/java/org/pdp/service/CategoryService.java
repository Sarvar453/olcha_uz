package org.pdp.service;

import lombok.RequiredArgsConstructor;
import org.pdp.Dao.CategoryDao;
import org.pdp.entity.Category;

import java.util.List;

@RequiredArgsConstructor
public class CategoryService {
    private final CategoryDao categoryDao;
    public List<Category> getCategoryList() {
        return categoryDao.getCategories();
    }

    public void addCategory(String parentIdParam, String categoryName, String createdBy) {
        Integer parentId = null;
        if (parentIdParam != null && !parentIdParam.isEmpty()) {
            try {
                parentId = Integer.parseInt(parentIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        Category category = new Category(categoryName, parentId, createdBy, createdBy);
        categoryDao.addCategory(category);
    }
    public void updateCategory(String parentIdParam, int categoryId, String categoryName,String username){
        Integer parentId = null;
        if (parentIdParam != null && !parentIdParam.trim().isEmpty()) {
            try {
                parentId = Integer.parseInt(parentIdParam);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        Category category = new Category(categoryId,categoryName,parentId,username);
        categoryDao.updateCategory(category);
    }
}
