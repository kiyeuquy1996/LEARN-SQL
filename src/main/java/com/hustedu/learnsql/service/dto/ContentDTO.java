package com.hustedu.learnsql.service.dto;
import java.time.Instant;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the Content entity.
 */
public class ContentDTO implements Serializable {

    private Long id;

    @NotNull
    private String title;

    @NotNull
    private String content;

    private String createdBy;

    private Instant createdDate;

    private String lastModifiedBy;

    private Instant lastModifiedDate;

    private Long categoryId;

    private Long typeContentId;

    private String categoryName;

    private String typeContentName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getTypeContentName() {
        return typeContentName;
    }

    public void setTypeContentName(String typeContentName) {
        this.typeContentName = typeContentName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getTypeContentId() {
        return typeContentId;
    }

    public void setTypeContentId(Long typeContentId) {
        this.typeContentId = typeContentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ContentDTO contentDTO = (ContentDTO) o;
        if (contentDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), contentDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "ContentDTO{" +
            "id=" + getId() +
            ", title='" + getTitle() + "'" +
            ", content='" + getContent() + "'" +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", updatedDate='" + getLastModifiedDate() + "'" +
            ", updatedBy=" + getLastModifiedBy() +
            ", category=" + getCategoryId() +
            ", typeContent=" + getTypeContentId() +
            "}";
    }
}
