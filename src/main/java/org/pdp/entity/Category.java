package org.pdp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category {
    private int id;
    private String name;
    private int parentId;
    private Date created_at;
    private Date modified_at;
    private String created_by;
    private String modified_by;
    private boolean active;

    public Category(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.parentId = resultSet.getInt("parent_id");
        this.created_at = resultSet.getDate("created_at");
        this.modified_at = resultSet.getDate("modified_at");
        this.created_by = resultSet.getString("created_by");
        this.modified_by = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }
}