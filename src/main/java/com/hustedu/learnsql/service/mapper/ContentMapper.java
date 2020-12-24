package com.hustedu.learnsql.service.mapper;

import com.hustedu.learnsql.domain.Content;
import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.service.dto.ContentDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity Content and its DTO ContentDTO.
 */
@Mapper(componentModel = "spring", uses = {CategoryMapper.class, TypeContentMapper.class})
public interface ContentMapper extends EntityMapper<ContentDTO, Content> {

    @Mapping(source = "category.id", target = "categoryId")
    @Mapping(source = "typeContent.id", target = "typeContentId")
    @Mapping(source = "category.nameCategory", target = "categoryName")
    @Mapping(source = "typeContent.nameTypeContent", target = "typeContentName")
    ContentDTO toDto(Content content);

    @Mapping(source = "categoryId", target = "category")
    @Mapping(source = "typeContentId", target = "typeContent")
    Content toEntity(ContentDTO contentDTO);

    default Content fromId(Long id) {
        if (id == null) {
            return null;
        }
        Content content = new Content();
        content.setId(id);
        return content;
    }
}
