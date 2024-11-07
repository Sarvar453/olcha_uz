package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    private int id;
    private String username;
    private String phone_number;
    private String password;
    private String email;
    private String createdAt;
    private String modifiedAt;
    private String createdBy;
    private String modifiedBy;
    private boolean active = true;

    public User(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.username = resultSet.getString("username");
        this.phone_number = resultSet.getString("phone_number");
        this.email = resultSet.getString("email");
        this.password = resultSet.getString("password");
        this.createdAt = resultSet.getString("created_at");
        this.createdBy = resultSet.getString("created_by");
        this.modifiedAt = resultSet.getString("modified_at");
        this.modifiedBy = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }
}

