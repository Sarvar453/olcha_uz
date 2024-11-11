package org.pdp.Dao;

import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.Cart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final DatabaseConfig databaseConfig;
    private static final String GET_CART_LIST = "select * from read_cart()";
    private static final String INSERT_CART = "select * from create_cart(i_product_id := ?, i_quantity := ?)";
    private static final String DELETE_CART = "select * from delete_cart(i_id := ?)";
    private static final String UPDATE_CART = "select * from update_cart(i_id := ?, i_product_id := ?, i_quantity := ?)";

    public CartDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<Cart> getCarts() {
        List<Cart> carts = new ArrayList<>();
        try (Connection connect = databaseConfig.connect()) {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_CART_LIST);
            while (resultSet.next()) {
                Cart cart = new Cart(resultSet);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public void deleteCart(int cartId) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(DELETE_CART)) {
                statement.setInt(1, cartId);
                statement.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateCart(Cart cart) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(UPDATE_CART)) {
                statement.setInt(1, cart.getId());
                statement.setInt(2, cart.getProduct_id());
                statement.setInt(3, cart.getQuantity());
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addCart(Cart cart) {
        try (Connection connect = databaseConfig.connect();
             PreparedStatement statement = connect.prepareStatement(INSERT_CART)) {
            statement.setInt(1, cart.getProduct_id());
            statement.setInt(2, cart.getQuantity());
            statement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
