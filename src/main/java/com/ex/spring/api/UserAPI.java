package com.ex.spring.api;

import com.ex.spring.dto.UserDTO;
import com.ex.spring.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "userAPI")
public class UserAPI {
    @Autowired
    private IUserService userService;

    @PostMapping(value = "/api/register")
    public UserDTO registerUser(@RequestBody UserDTO userDTO) {
        return userService.registerUser(userDTO);
    }
}
