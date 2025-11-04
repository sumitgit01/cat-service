package com.cat_service.repository;

import com.cat_service.model.Cat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CatRepository extends JpaRepository<Cat, Long> {
}
