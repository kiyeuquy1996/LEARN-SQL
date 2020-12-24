package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.ExercisesAnswer;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the ExercisesAnswer entity.
 */
public interface ExercisesAnswerSearchRepository extends ElasticsearchRepository<ExercisesAnswer, Long> {
}
