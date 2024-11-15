package org.pdp.entity;

import com.google.gson.Gson;
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
public class Product {
    private Integer id;
    private Integer categoryId;
    private String name;
    private Double price;
    private String images;
    private String params;
    private String color;
    private String description;
    private Integer discount;
    private String fromDelivery;
    private String toDelivery;
    private Timestamp createdAt;
    private Timestamp modifiedAt;
    private String createdBy;
    private String modifiedBy;
    private Boolean active;

    public Product(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.price = resultSet.getDouble("price");
        this.images = resultSet.getString("images");
        this.params = resultSet.getString("params");
        this.color = resultSet.getString("color");
        this.description = resultSet.getString("description");
        this.discount = resultSet.getInt("discount");
        this.fromDelivery = resultSet.getString("from_delivery");
        this.fromDelivery = resultSet.getString("from_delivery");
        this.createdAt = resultSet.getTimestamp("created_at");
        this.modifiedAt = resultSet.getTimestamp("modified_at");
        this.createdBy = resultSet.getString("created_by");
        this.modifiedBy = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }
    public Product(String name, Double price, String images, String params, String color, String description, Integer discount, String fromDelivery, String toDelivery, String createdBy,Integer categoryId){
        this.categoryId = categoryId;
        this.name = name;
        this.price = price;
        this.images = images;
        this.params = params;
        this.color = color;
        this.description = description;
        this.discount = discount;
        this.fromDelivery = fromDelivery;
        this.toDelivery = toDelivery;
        this.createdBy = createdBy;
    }
    public Product(Integer id,Integer categoryId,String name, Double price, String images, String params, String color, String description, Integer discount, String fromDelivery, String toDelivery, String createdBy){
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.price = price;
        this.images = images;
        this.params = params;
        this.color = color;
        this.description = description;
        this.discount = discount;
        this.fromDelivery = fromDelivery;
        this.toDelivery = toDelivery;
        this.createdBy = createdBy;
    }
    public Product(String name, Double price, String description, Integer discount, String fromDelivery, String toDelivery, String createdBy){
        this.name = name;
        this.price = price;
        this.description = description;
        this.discount = discount;
        this.fromDelivery = fromDelivery;
        this.toDelivery = toDelivery;
        this.createdBy = createdBy;
    }
}
