package com.epam.javatraining.spring.web.service;

import com.epam.javatraining.spring.web.controller.dto.UserDto;
import com.epam.javatraining.spring.web.domain.User;
import com.epam.javatraining.spring.web.exception.UsernameExistsException;

public interface UserService extends BasicService<User, Long> {
    User findOneByUsername(String username);
    User registerNewUserAccount(UserDto userDto) throws UsernameExistsException;
}
