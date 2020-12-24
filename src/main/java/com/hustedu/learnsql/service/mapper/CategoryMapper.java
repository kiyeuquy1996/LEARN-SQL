package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.Category;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.CategoryDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity Category and its DTO CategoryDTO.
 */
@Mapper(componentModel = "spring", uses = {CategoryTypeMapper.class})
public interface CategoryMapper extends EntityMapper<CategoryDTO, Category> {

    @Mapping(source = "categoryType.id", target = "categoryTypeId")
    @Mapping(source = "categoryType.nameCategoryType", target = "categoryTypeName")
    CategoryDTO toDto(Category category);

    @Mapping(source = "categoryTypeId", target = "categoryType")
    @Mapping(target = "cateIDS", ignore = true)
    @Mapping(target = "categoryIDS", ignore = true)
    Category toEntity(CategoryDTO categoryDTO);

    default Category fromId(Long id) {
        if (id == null) {
            return null;
        }
        Category category = new Category();
        category.setId(id);
        return category;
    }
}
