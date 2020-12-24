package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.Exercises;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the Exercises entity.
 */
public interface ExercisesSearchRepository extends ElasticsearchRepository<Exercises, Long> {
}
