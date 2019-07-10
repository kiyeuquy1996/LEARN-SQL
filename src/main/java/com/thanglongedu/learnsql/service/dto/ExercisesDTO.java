package com.thanglongedu.learnsql.service.dto;
import java.time.Instant;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the Exercises entity.
 */
public class ExercisesDTO implements Serializable {

    private Long id;

    @NotNull
    private String nameExercises;

    @NotNull
    private String question;

    @NotNull
    private Integer score;

    @NotNull
    private Integer timeOnMinutes;

    @NotNull
    private String createdBy;

    @NotNull
    private Instant createdDate;

    @NotNull
    private String lastModifiedBy;

    @NotNull
    private Instant lastModifiedDate;

    private Long categoryId;

    private String categoryName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNameExercises() {
        return nameExercises;
    }

    public void setNameExercises(String nameExercises) {
        this.nameExercises = nameExercises;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getTimeOnMinutes() {
        return timeOnMinutes;
    }

    public void setTimeOnMinutes(Integer timeOnMinutes) {
        this.timeOnMinutes = timeOnMinutes;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ExercisesDTO exercisesDTO = (ExercisesDTO) o;
        if (exercisesDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), exercisesDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "ExercisesDTO{" +
            "id=" + getId() +
            ", nameExercises='" + getNameExercises() + "'" +
            ", question='" + getQuestion() + "'" +
            ", score=" + getScore() +
            ", timeOnMinutes=" + getTimeOnMinutes() +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", updatedDate='" + getLastModifiedDate() + "'" +
            ", updatedBy=" + getLastModifiedBy() +
            ", category=" + getCategoryId() +
            "}";
    }
}
