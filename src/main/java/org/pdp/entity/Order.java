package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
    private int id;
    private int userId;
    private String status;
    private int promo_code_id;
    private Timestamp created_at;
    private Timestamp modified_at;
    private String created_by;
    private String modified_by;
    private boolean active;

    public Order(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.userId = resultSet.getInt("user_id");
        this.status = resultSet.getString("status");
        this.promo_code_id = resultSet.getInt("promo_code_id");
        this.created_at = resultSet.getTimestamp("created_at");
        this.modified_at = resultSet.getTimestamp("modified_at");
        this.created_by = resultSet.getString("created_by");
        this.modified_by = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }
}
