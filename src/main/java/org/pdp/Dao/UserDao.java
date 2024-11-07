package org.pdp.Dao;



import org.pdp.config.DatabaseConfig;
import org.pdp.config.PostgresDatabaseConfig;
import org.pdp.entity.User;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private final DatabaseConfig databaseConfig;
    private static final String GET_USER_LIST = "select * from read_users()";
    private static final String INSERT_USER = "select * from create_users(i_username := ?, i_email := ?, i_password := ?)";

    public UserDao() {
        this.databaseConfig = new PostgresDatabaseConfig();
    }

    public List<User> getUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connect = databaseConfig.connect()) {
            Statement statement = connect.createStatement();
            ResultSet resultSet = statement.executeQuery(GET_USER_LIST);
            while (resultSet.next()) {
                User user = new User(resultSet);
                users.add(user);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User addUser(User user) {
        try (Connection connect = databaseConfig.connect();
             PreparedStatement statement = connect.prepareStatement(INSERT_USER)) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getEmail());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return new User(resultSet);
            }else {
                throw new IllegalArgumentException();
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}

