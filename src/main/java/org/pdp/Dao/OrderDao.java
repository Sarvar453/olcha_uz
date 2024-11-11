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
    private static final String GET_ORDER_LIST = "SELECT * FROM read_order()";
    private static final String INSERT_ORDER = "SELECT * FROM create_order(i_customer_id := ?, i_total_amount := ?, i_status := ?)";
    private static final String DELETE_ORDER = "SELECT * FROM delete_order(i_id := ?)";
    private static final String UPDATE_ORDER = "SELECT * FROM update_order(i_id := ?, i_customer_id := ?, i_total_amount := ?, i_status := ?)";

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

    public void deleteOrder(int orderId) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(DELETE_ORDER)) {
                statement.setInt(1, orderId);
                statement.executeQuery();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateOrder(Order order) {
        try (Connection connection = postgresDatabaseConfig.connect()) {
            try (PreparedStatement statement = connection.prepareStatement(UPDATE_ORDER)) {
                statement.setInt(1, order.getId());
                statement.setInt(2, order.getUserId());
                statement.setDouble(3, order.getQuantity());
                statement.setString(4, order.getStatus());
                statement.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addOrder(Order order) {
        try (Connection connect = databaseConfig.connect();
             PreparedStatement statement = connect.prepareStatement(INSERT_ORDER)) {
            statement.setInt(1, order.getUserId());
            statement.setDouble(2, order.getQuantity());
            statement.setString(3, order.getStatus());
            statement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
