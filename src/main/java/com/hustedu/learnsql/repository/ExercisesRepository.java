package com.hustedu.learnsql.repository;

import com.hustedu.learnsql.domain.Exercises;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the Exercises entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ExercisesRepository extends JpaRepository<Exercises, Long> {

}
