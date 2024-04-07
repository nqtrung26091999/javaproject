package com.ex.spring.converter;

import com.ex.spring.dto.UserDTO;
import com.ex.spring.entity.UserEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class UserConverter {
    public UserDTO toDTO(UserEntity userEntity) {
        UserDTO result = new UserDTO();
        result.setId(userEntity.getId());
        result.setUsername(userEntity.getUserName());
        result.setFullName(userEntity.getFullName());
        result.setCreatedDate(userEntity.getCreatedDate());
        result.setStatus(userEntity.getStatus());
        result.setRoleCode(userEntity.getRoles().get(0).getCode());
        return result;
    }

    public UserEntity toEntity(UserDTO userDTO) {
        UserEntity result = new UserEntity();
        result.setFullName(userDTO.getFullName());
        result.setUsername(userDTO.getUsername());
        result.setStatus(userDTO.getStatus());
        result.setPassword(new BCryptPasswordEncoder().encode(userDTO.getPassword()));
        return result;
    }

    public UserEntity toEntity(UserEntity entity, UserDTO dto) {
        entity.setUsername(dto.getUsername());
        entity.setFullName(dto.getFullName());
        entity.setStatus(dto.getStatus());
        return entity;
    }
}
