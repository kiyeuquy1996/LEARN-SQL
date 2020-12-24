package com.hustedu.learnsql.repository;

import com.hustedu.learnsql.domain.CategoryType;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the CategoryType entity.
 */
@SuppressWarnings("unused")
@Repository
public interface CategoryTypeRepository extends JpaRepository<CategoryType, Long> {

}
