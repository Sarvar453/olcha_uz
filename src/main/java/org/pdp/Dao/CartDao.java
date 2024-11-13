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

    public CartDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<Cart> getCarts() {
        List<Cart> carts = new ArrayList<>();


        try (Connection connect = databaseConfig.connect();
             Statement statement = connect.createStatement();
             ResultSet resultSet = statement.executeQuery(GET_CART_LIST)) {

            while (resultSet.next()) {
                Cart cart = new Cart(resultSet);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }
}
