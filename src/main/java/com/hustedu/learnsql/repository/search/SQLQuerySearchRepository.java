package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.SQLQuery;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the SQLQuery entity.
 */
public interface SQLQuerySearchRepository extends ElasticsearchRepository<SQLQuery, Long> {
}
