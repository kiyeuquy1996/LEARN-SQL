package com.thanglongedu.learnsql.service.dto;
import java.time.Instant;
import javax.validation.constraints.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the ExercisesAnswer entity.
 */
public class ExercisesAnswerDTO implements Serializable {

    private Long id;

    @NotNull
    private String result;

    private Boolean isCorrect;

    @NotNull
    private String createdBy;

    @NotNull
    private Instant createdDate;

    @NotNull
    private String lastModifiedBy;

    @NotNull
    private Instant lastModifiedDate;

    private Long exercisesId;

    private String exercisesName;

    public String getExercisesName() {
        return exercisesName;
    }

    public void setExercisesName(String exercisesName) {
        this.exercisesName = exercisesName;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Boolean isIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(Boolean isCorrect) {
        this.isCorrect = isCorrect;
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

    public Long getExercisesId() {
        return exercisesId;
    }

    public void setExercisesId(Long exercisesId) {
        this.exercisesId = exercisesId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ExercisesAnswerDTO exercisesAnswerDTO = (ExercisesAnswerDTO) o;
        if (exercisesAnswerDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), exercisesAnswerDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "ExercisesAnswerDTO{" +
            "id=" + getId() +
            ", result='" + getResult() + "'" +
            ", isCorrect='" + isIsCorrect() + "'" +
            ", createdDate='" + getCreatedDate() + "'" +
            ", createdBy=" + getCreatedBy() +
            ", updatedDate='" + getLastModifiedDate() + "'" +
            ", updatedBy=" + getLastModifiedBy() +
            ", exercises=" + getExercisesId() +
            "}";
    }
}
