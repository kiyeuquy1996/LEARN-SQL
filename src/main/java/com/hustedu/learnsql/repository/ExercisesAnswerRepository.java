package com.hustedu.learnsql.repository;

import com.hustedu.learnsql.domain.ExercisesAnswer;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the ExercisesAnswer entity.
 */
@SuppressWarnings("unused")
@Repository
public interface ExercisesAnswerRepository extends JpaRepository<ExercisesAnswer, Long> {

}
