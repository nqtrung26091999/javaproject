package com.ex.spring.repository;

import com.ex.spring.entity.NewsEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NewsRepository extends JpaRepository<NewsEntity, Long> {
    NewsEntity save(NewsEntity newsEntity);
    @Query(value = "SELECT MAX(n.id) FROM NewsEntity n")
    Long findMaxId();
}
