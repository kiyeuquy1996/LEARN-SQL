package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.Employees;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the Employees entity.
 */
public interface EmployeesSearchRepository extends ElasticsearchRepository<Employees, Long> {
}
