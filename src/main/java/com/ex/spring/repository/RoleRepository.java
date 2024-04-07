package com.ex.spring.repository;

import com.ex.spring.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<RoleEntity, Long>{
	RoleEntity findByCode(String roleCode);
}
