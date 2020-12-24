package com.hustedu.learnsql.service.dto;
import java.time.Instant;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;
import java.util.Set;

/**
 * A DTO for the CategoryType entity.
 */
public class CategoryTypeDTO implements Serializable {

    private Long id;

    @NotNull
    private String nameCategoryType;

    private String description;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    private Set<CategoryDTO> categoryTypeIDS;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameCategoryType() {
        return nameCategoryType;
    }

    public void setNameCategoryType(String nameCategoryType) {
        this.nameCategoryType = nameCategoryType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Instant getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Instant createdDate) {
        this.createdDate = createdDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getLastModifiedBy() {
        return lastModifiedBy;
    }

    public void setLastModifiedBy(String lastModifiedBy) {
        this.lastModifiedBy = lastModifiedBy;
    }

    public Instant getLastModifiedDate() {
        return lastModifiedDate;
    }

    public void setLastModifiedDate(Instant lastModifiedDate) {
        this.lastModifiedDate = lastModifiedDate;
    }

    public Set<CategoryDTO> getCategoryTypeIDS() {
        return categoryTypeIDS;
    }

    public void setCategoryTypeIDS(Set<CategoryDTO> categoryTypeIDS) {
        this.categoryTypeIDS = categoryTypeIDS;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        CategoryTypeDTO categoryTypeDTO = (CategoryTypeDTO) o;
        if (categoryTypeDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), categoryTypeDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "CategoryTypeDTO{" +
            "id=" + getId() +
            ", nameCategoryType='" + getNameCategoryType() + "'" +
            ", description='" + getDescription() + "'" +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", updatedDate='" + getLastModifiedDate() + "'" +
            ", updatedBy=" + getLastModifiedBy() +
            "}";
    }
}
