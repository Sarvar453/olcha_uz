package org.pdp.Dao;

import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private final PostgresDatabaseConfig postgresDatabaseConfig = new PostgresDatabaseConfig();
    private final DatabaseConfig databaseConfig;
    private static final String GET_ORDER_LIST = "select * from orders";

    public OrderDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<Order> getOrders() {
        List<Order> orders = new ArrayList<>();
        try (Connection connect = databaseConfig.connect()) {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_ORDER_LIST);
            while (resultSet.next()) {
                Order order = new Order(resultSet);
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
}
