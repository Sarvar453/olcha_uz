package org.pdp.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Category {
    private Integer id;
    private String name;
    private Integer parentId;
    private String createdAt;
    private String modifiedAt;
    private String createdBy;
    private String modifiedBy;
    private Boolean active;

    public Category(ResultSet resultSet) throws SQLException {
        this.id = resultSet.getInt("id");
        this.name = resultSet.getString("name");
        this.parentId = resultSet.getInt("parent_id");
        this.createdAt = resultSet.getString("created_at");
        this.createdBy = resultSet.getString("created_by");
        this.modifiedAt = resultSet.getString("modified_at");
        this.modifiedBy = resultSet.getString("modified_by");
        this.active = resultSet.getBoolean("active");
    }

    public Category(String name, Integer parentId, String createdBy, String modifiedBy) {
        this.name = name;
        this.parentId = parentId;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
    }

    public Category(Integer id, String name, Integer parentId, String modifiedBy) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
        this.modifiedBy = modifiedBy;
    }
}

