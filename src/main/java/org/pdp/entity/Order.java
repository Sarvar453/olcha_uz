package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
    private int id;
    private int userId;
    private String status;
    private boolean active;
    private int quantity;
    private int productId;
    private Date created_date;
    private Date updated_date;

    public Order(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.userId = resultSet.getInt("user_id");
        this.status = resultSet.getString("status");
        this.active = resultSet.getBoolean("active");
        this.quantity = resultSet.getInt("quantity");
        this.created_date = resultSet.getDate("created_date");
        this.updated_date = resultSet.getDate("updated_date");
    }

    public  Order(int id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }

    public Order(int id, int productId, int quantity) {
        this.id = id;
        this.productId = productId;
        this.quantity = quantity;
    }
}
