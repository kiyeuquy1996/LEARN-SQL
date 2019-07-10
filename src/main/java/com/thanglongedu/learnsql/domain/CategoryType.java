package com.thanglongedu.learnsql.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.springframework.data.elasticsearch.annotations.Document;
import java.io.Serializable;
import java.time.Instant;
import java.util.HashSet;
import java.util.Set;
import java.util.Objects;

/**
 * A CategoryType.
 */
@Entity
@Table(name = "category_type")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "categorytype")
public class CategoryType extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Column(name = "name_category_type", nullable = false)
    private String nameCategoryType;

    @Column(name = "description")
    private String description;

    @OneToMany(mappedBy = "categoryType")
    @Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
    private Set<Category> categoryTypeIDS = new HashSet<>();
    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameCategoryType() {
        return nameCategoryType;
    }

    public CategoryType nameCategoryType(String nameCategoryType) {
        this.nameCategoryType = nameCategoryType;
        return this;
    }

    public void setNameCategoryType(String nameCategoryType) {
        this.nameCategoryType = nameCategoryType;
    }

    public String getDescription() {
        return description;
    }

    public CategoryType description(String description) {
        this.description = description;
        return this;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Category> getCategoryTypeIDS() {
        return categoryTypeIDS;
    }

    public CategoryType categoryTypeIDS(Set<Category> categories) {
        this.categoryTypeIDS = categories;
        return this;
    }

    public CategoryType addCategoryTypeID(Category category) {
        this.categoryTypeIDS.add(category);
        category.setCategoryType(this);
        return this;
    }

    public CategoryType removeCategoryTypeID(Category category) {
        this.categoryTypeIDS.remove(category);
        category.setCategoryType(null);
        return this;
    }

    public void setCategoryTypeIDS(Set<Category> categories) {
        this.categoryTypeIDS = categories;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        CategoryType categoryType = (CategoryType) o;
        if (categoryType.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), categoryType.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "CategoryType{" +
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
