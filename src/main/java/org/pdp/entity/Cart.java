package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.xml.transform.Result;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Cart {
    private int id;
    private int user_id;
    private int product_id;
    private int quantity;
    private boolean active;
    private Date created_date;
    private Date updated_date;

    public Cart(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.user_id = resultSet.getInt("user_id");
        this.product_id = resultSet.getInt("product_id");
        this.active = resultSet.getBoolean("active");
        this.created_date = resultSet.getDate("created_date");
        this.updated_date = resultSet.getDate("updated_date");
    }
}
