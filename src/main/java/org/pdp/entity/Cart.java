package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cart {
    private int id;
    private int user_id;
    private int product_id;
    private int quantity;
    private Timestamp createdAt;
    private Timestamp modifiedAt;
    private String createdBy;
    private String modifiedBy;
    private boolean active;

    public Cart(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.user_id = resultSet.getInt("user_id");
        this.product_id = resultSet.getInt("product_id");
        this.quantity = resultSet.getInt("quantity");
        this.createdAt = resultSet.getTimestamp("created_at");
        this.modifiedAt = resultSet.getTimestamp("modified_at");
        this.createdBy = resultSet.getString("created_by");
        this.modifiedBy = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }
}
