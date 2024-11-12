package org.pdp.config;
import org.pdp.config.exception.PostgresConnectException;
import org.pdp.entity.Category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class PostgresDatabaseConfig implements DatabaseConfig {
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "root123";
    private static final String DATABASE = "olcha_uz";

    @Override
    public Connection connect() {
        try {
            return DriverManager.getConnection("jdbc:postgresql://10.10.2.140:5432/olcha_uz", USERNAME, PASSWORD);
        }
        catch (SQLException e) {
            e.printStackTrace();
            throw new PostgresConnectException("Postgres Database Connection Failed");
        }
    }
}
