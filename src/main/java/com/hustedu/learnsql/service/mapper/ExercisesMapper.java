package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.Exercises;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.ExercisesDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity Exercises and its DTO ExercisesDTO.
 */
@Mapper(componentModel = "spring", uses = {CategoryMapper.class})
public interface ExercisesMapper extends EntityMapper<ExercisesDTO, Exercises> {

    @Mapping(source = "category.id", target = "categoryId")
    @Mapping(source = "category.nameCategory", target = "categoryName")
    ExercisesDTO toDto(Exercises exercises);

    @Mapping(source = "categoryId", target = "category")
    @Mapping(target = "exercisesIDS", ignore = true)
    Exercises toEntity(ExercisesDTO exercisesDTO);

    default Exercises fromId(Long id) {
        if (id == null) {
            return null;
        }
        Exercises exercises = new Exercises();
        exercises.setId(id);
        return exercises;
    }
}
