package com.hustedu.learnsql.repository.search;

import com.hustedu.learnsql.domain.User;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * Spring Data Elasticsearch repository for the User entity.
 */
public interface UserSearchRepository extends ElasticsearchRepository<User, Long> {
}
