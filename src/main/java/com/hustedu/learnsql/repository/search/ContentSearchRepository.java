package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.Content;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the Content entity.
 */
public interface ContentSearchRepository extends ElasticsearchRepository<Content, Long> {
}
