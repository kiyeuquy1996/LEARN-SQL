package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.Customer;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the Customer entity.
 */
public interface CustomerSearchRepository extends ElasticsearchRepository<Customer, Long> {
}
