package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.CategoryType;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.CategoryTypeDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity CategoryType and its DTO CategoryTypeDTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface CategoryTypeMapper extends EntityMapper<CategoryTypeDTO, CategoryType> {

    @Mapping(target = "categoryTypeIDS", source = "categoryTypeIDS")
    CategoryTypeDTO toDto(CategoryType categoryType);

    @Mapping(target = "categoryTypeIDS", ignore = true)
    CategoryType toEntity(CategoryTypeDTO categoryTypeDTO);

    default CategoryType fromId(Long id) {
        if (id == null) {
            return null;
        }
        CategoryType categoryType = new CategoryType();
        categoryType.setId(id);
        return categoryType;
    }
}
