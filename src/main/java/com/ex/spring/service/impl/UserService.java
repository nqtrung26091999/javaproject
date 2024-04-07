package com.ex.spring.service.impl;

import com.ex.spring.constant.SystemConstant;
import com.ex.spring.converter.UserConverter;
import com.ex.spring.dto.UserDTO;
import com.ex.spring.entity.RoleEntity;
import com.ex.spring.entity.UserEntity;
import com.ex.spring.repository.RoleRepository;
import com.ex.spring.repository.UserRepository;
import com.ex.spring.service.IUserService;
import com.ex.spring.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private RoleRepository roleRepository;
    @Override
    public UserDTO registerUser(UserDTO dto) {
        UserEntity result = userRepository.findOneByUserName(dto.getUsername());
        UserEntity userEntity = userConverter.toEntity(dto);
        List<RoleEntity> listRole = new ArrayList<>();
        List<String> roles = SecurityUtils.getAuthorities();
        if (result != null) {
            return null;
        }
        if (!Objects.equals(dto.getPassword(), dto.getRePassword())) {
            return null;
        }
        RoleEntity role;
        if (!roles.contains(SystemConstant.ROLE_ANONYMOUS)) {
            role = roleRepository.findByCode(dto.getRoleCode());
        } else {
            role = roleRepository.findByCode(SystemConstant.ROLE_USER);
        }
        if (role != null) {
            listRole.add(role);
            userEntity.setRoles(listRole);
        }
        userEntity.setStatus(SystemConstant.ACTIVE_STATUS);
        return userConverter.toDTO(userRepository.save(userEntity));
    }
}
