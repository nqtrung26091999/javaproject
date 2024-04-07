package com.ex.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ex.spring.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
	UserEntity findOneByUserNameAndStatus(String name, int status);

    UserEntity findOneByUserName(String username);
}
