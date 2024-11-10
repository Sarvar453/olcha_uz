package org.pdp.Dao;

import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.Category;
import org.pdp.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final DatabaseConfig databaseConfig;
    private static final String GET_CATEGORY_LIST = "select * from read_category()";
    private static final String INSERT_CATEGORY = "select * from create_category(i_name := ?, i_parent_id := ?)";
    private static final String DELETE_CATEGORY = "select * from delete_category(i_id := ?)";
    private static final String UPDATE_CATEGORY = "select * from update_category(i_id := ?, i_name := ?, i_parent_id := ?)";
    public CategoryDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }
    public List<Category> getCategories() {
        List<Category> categories = new ArrayList<>();
        try (Connection connect = databaseConfig.connect()) {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_CATEGORY_LIST);
            while (resultSet.next()) {
                Category category = new Category(resultSet);
                categories.add(category);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }
    public void deleteCategory(int categoryId){
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(DELETE_CATEGORY)) {
                statement.setInt(1, categoryId);
                statement.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateCategory(Category category){
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(UPDATE_CATEGORY)) {
                statement.setInt(1, category.getId());
                statement.setString(2, category.getName());
                if (category.getParentId()!=null){
                    statement.setInt(3, category.getParentId());
                }
                else{
                    statement.setNull(3, Types.INTEGER);
                }
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addCategory(Category category) {
        try (Connection connect = databaseConfig.connect();
             PreparedStatement statement = connect.prepareStatement(INSERT_CATEGORY)) {
            statement.setString(1, category.getName());
            if (category.getParentId()!=null){
                statement.setInt(2, category.getParentId());
            }
            else{
                statement.setNull(2, Types.INTEGER);
            }
            statement.executeQuery();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
