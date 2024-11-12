package org.pdp.Dao;

import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final DatabaseConfig databaseConfig;
    private static final String GET_PRODUCT_LIST = "select * from read_product()";
    private static final String INSERT_PRODUCT = "select * from create_product(i_name := ?, i_price := ?, i_description := ?, i_discount := ?, i_from_delivery := ?, i_to_delivery := ?, i_created_by := ?)";
    private static final String DELETE_PRODUCT = "select * from delete_product(i_id := ?)";
    private static final String UPDATE_PRODUCT = "select * from update_product(i_id := ?, i_name := ?, i_price := ?, i_images := ?, i_params := ?, i_color := ?, i_description := ?, i_discount := ?, i_from_delivery := ?, i_to_delivery := ?, i_modified_by := ?)";

    public ProductDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connect = databaseConfig.connect()) {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_PRODUCT_LIST);
            while (resultSet.next()) {
                Product product = new Product(resultSet);
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
    public void deleteProduct(int productId) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT)) {
                statement.setInt(1, productId);
                statement.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateProduct(Product product) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT)) {
                statement.setInt(1, product.getId());
                statement.setString(2, product.getName());
                statement.setDouble(3, product.getPrice());
                statement.setString(4, product.getDescription());
                statement.setInt(5, product.getDiscount());
                statement.setDate(6, product.getFromDelivery());
                statement.setDate(7, product.getToDelivery());
                statement.setString(8, product.getModifiedBy());

                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void addProduct(Product product) {
        try (Connection connect = databaseConfig.connect();
             PreparedStatement statement = connect.prepareStatement(INSERT_PRODUCT)) {
            statement.setString(1, product.getName());
            statement.setDouble(2, product.getPrice());
            statement.setString(3, product.getDescription());
            statement.setInt(4, product.getDiscount());
            statement.setDate(5, product.getFromDelivery());
            statement.setDate(6, product.getToDelivery());
            statement.setString(7, product.getModifiedBy());
            statement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
