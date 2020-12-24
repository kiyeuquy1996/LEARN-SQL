package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.ExercisesAnswer;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.ExercisesAnswerDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity ExercisesAnswer and its DTO ExercisesAnswerDTO.
 */
@Mapper(componentModel = "spring", uses = {ExercisesMapper.class})
public interface ExercisesAnswerMapper extends EntityMapper<ExercisesAnswerDTO, ExercisesAnswer> {

    @Mapping(source = "exercises.id", target = "exercisesId")
    @Mapping(source = "exercises.nameExercises", target = "exercisesName")
    ExercisesAnswerDTO toDto(ExercisesAnswer exercisesAnswer);

    @Mapping(source = "exercisesId", target = "exercises")
    ExercisesAnswer toEntity(ExercisesAnswerDTO exercisesAnswerDTO);

    default ExercisesAnswer fromId(Long id) {
        if (id == null) {
            return null;
        }
        ExercisesAnswer exercisesAnswer = new ExercisesAnswer();
        exercisesAnswer.setId(id);
        return exercisesAnswer;
    }
}
