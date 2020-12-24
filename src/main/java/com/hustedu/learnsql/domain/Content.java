package com.hustedu.learnsql.domain;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.springframework.data.elasticsearch.annotations.Document;
import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

/**
 * A Content.
 */
@Entity
@Table(name = "content")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
@Document(indexName = "content")
public class Content extends AbstractAuditingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Column(name = "title", nullable = false)
    private String title;

    @NotNull
    @Column(name = "content", nullable = false)
    private String content;

    @ManyToOne
    @JsonIgnoreProperties("cateIDS")
    private Category category;

    @ManyToOne
    @JsonIgnoreProperties("typeContentIDS")
    private TypeContent typeContent;

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public Content title(String title) {
        this.title = title;
        return this;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public Content content(String content) {
        this.content = content;
        return this;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Category getCategory() {
        return category;
    }

    public Content category(Category category) {
        this.category = category;
        return this;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public TypeContent getTypeContent() {
        return typeContent;
    }

    public Content typeContent(TypeContent typeContent) {
        this.typeContent = typeContent;
        return this;
    }

    public void setTypeContent(TypeContent typeContent) {
        this.typeContent = typeContent;
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
        Content content = (Content) o;
        if (content.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), content.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "Content{" +
            "id=" + getId() +
            ", title='" + getTitle() + "'" +
            ", content='" + getContent() + "'" +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", updatedDate='" + getLastModifiedDate() + "'" +
            ", updatedBy=" + getLastModifiedBy() +
            "}";
    }
}
