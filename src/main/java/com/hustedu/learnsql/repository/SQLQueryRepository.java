package com.hustedu.learnsql.repository;

import com.hustedu.learnsql.domain.SQLQuery;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the SQLQuery entity.
 */
@SuppressWarnings("unused")
@Repository
public interface SQLQueryRepository extends JpaRepository<SQLQuery, Long> {

}
