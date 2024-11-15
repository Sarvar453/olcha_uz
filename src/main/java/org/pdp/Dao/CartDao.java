package org.pdp.Dao;

import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.Cart;
import org.pdp.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final DatabaseConfig databaseConfig;
    UserDao userDao = new UserDao();
    private static final String GET_CART_LIST = "select * from read_cart()";

    public CartDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<Cart> getCarts() {
        List<Cart> carts = new ArrayList<>();
        String query = GET_CART_LIST;  // Using the predefined SQL query

        try (Connection connect = databaseConfig.connect();
             Statement statement = connect.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Cart cart = new Cart(resultSet);
                User user = userDao.getById(resultSet.getInt("user_id"));
                cart.setUser(user);
                carts.add(cart);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }
}
