package com.hustedu.learnsql.config;

import java.time.Duration;

import com.hustedu.learnsql.domain.*;
import com.hustedu.learnsql.repository.UserRepository;
import org.ehcache.config.builders.*;
import org.ehcache.jsr107.Eh107Configuration;

import io.github.jhipster.config.jcache.BeanClassLoaderAwareJCacheRegionFactory;
import io.github.jhipster.config.JHipsterProperties;

import org.springframework.boot.autoconfigure.cache.JCacheManagerCustomizer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.*;

@Configuration
@EnableCaching
public class CacheConfiguration {

    private final javax.cache.configuration.Configuration<Object, Object> jcacheConfiguration;

    public CacheConfiguration(JHipsterProperties jHipsterProperties) {
        BeanClassLoaderAwareJCacheRegionFactory.setBeanClassLoader(this.getClass().getClassLoader());
        JHipsterProperties.Cache.Ehcache ehcache =
            jHipsterProperties.getCache().getEhcache();

        jcacheConfiguration = Eh107Configuration.fromEhcacheCacheConfiguration(
            CacheConfigurationBuilder.newCacheConfigurationBuilder(Object.class, Object.class,
                ResourcePoolsBuilder.heap(ehcache.getMaxEntries()))
                .withExpiry(ExpiryPolicyBuilder.timeToLiveExpiration(Duration.ofSeconds(ehcache.getTimeToLiveSeconds())))
                .build());
    }

    @Bean
    public JCacheManagerCustomizer cacheManagerCustomizer() {
        return cm -> {
            cm.createCache(UserRepository.USERS_BY_LOGIN_CACHE, jcacheConfiguration);
            cm.createCache(UserRepository.USERS_BY_EMAIL_CACHE, jcacheConfiguration);
            cm.createCache(User.class.getName(), jcacheConfiguration);
            cm.createCache(Authority.class.getName(), jcacheConfiguration);
            cm.createCache(User.class.getName() + ".authorities", jcacheConfiguration);
            cm.createCache(CategoryType.class.getName(), jcacheConfiguration);
            cm.createCache(CategoryType.class.getName() + ".categoryTypeIDS", jcacheConfiguration);
            cm.createCache(Category.class.getName(), jcacheConfiguration);
            cm.createCache(Category.class.getName() + ".cateIDS", jcacheConfiguration);
            cm.createCache(Category.class.getName() + ".categoryIDS", jcacheConfiguration);
            cm.createCache(Content.class.getName(), jcacheConfiguration);
            cm.createCache(SQLQuery.class.getName(), jcacheConfiguration);
            cm.createCache(TypeContent.class.getName(), jcacheConfiguration);
            cm.createCache(TypeContent.class.getName() + ".typeContentIDS", jcacheConfiguration);
            cm.createCache(Exercises.class.getName(), jcacheConfiguration);
            cm.createCache(Exercises.class.getName() + ".exercisesIDS", jcacheConfiguration);
            cm.createCache(ExercisesAnswer.class.getName(), jcacheConfiguration);
            cm.createCache(Orders.class.getName(), jcacheConfiguration);
            cm.createCache(Customer.class.getName(), jcacheConfiguration);
            cm.createCache(Customer.class.getName() + ".customerIDS", jcacheConfiguration);
            cm.createCache(Employees.class.getName(), jcacheConfiguration);
            cm.createCache(Employees.class.getName() + ".employeesIDS", jcacheConfiguration);
            cm.createCache(Shipper.class.getName(), jcacheConfiguration);
            cm.createCache(Shipper.class.getName() + ".shipperIDS", jcacheConfiguration);
            // jhipster-needle-ehcache-add-entry
        };
    }
}
