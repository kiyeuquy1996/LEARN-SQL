package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.Orders;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the Orders entity.
 */
public interface OrdersSearchRepository extends ElasticsearchRepository<Orders, Long> {
}
