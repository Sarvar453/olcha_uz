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
public class Product {
    private int id;
    private int categoryId;
    private String name;
    private double price;
    private boolean active;
    private Date created_date;
    private Date updated_date;

    public Product(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.price = resultSet.getDouble("price");
        this.active = resultSet.getBoolean("active");
        this.categoryId = resultSet.getInt("category_id");
        this.created_date = resultSet.getDate("created_date");
        this.updated_date = resultSet.getDate("updated_date");
    }
}
