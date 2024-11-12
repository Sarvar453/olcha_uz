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
    private Integer id;
    private String name;
    private String username;
    private String phone_number;
    private String password;
    private String email;
    private String createdAt;
    private String modifiedAt;
    private String createdBy;
    private String modifiedBy;
    private String role;
    private String permission;
    private Boolean active = true;
    public User(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.phone_number = resultSet.getString("phone_number");
        this.email = resultSet.getString("email");
        this.password = resultSet.getString("password");
        this.createdAt = resultSet.getString("created_at");
        this.createdBy = resultSet.getString("created_by");
        this.modifiedAt = resultSet.getString("modified_at");
        this.modifiedBy = resultSet.getString("modified_by");
        this.role = resultSet.getString("role");
        this.permission = resultSet.getString("permission");
        this.active = resultSet.getBoolean("active");
    }
}

