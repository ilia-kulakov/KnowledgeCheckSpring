package com.epam.javatraining.spring.web.dao;

import com.epam.javatraining.spring.web.domain.User;

public interface UserDao extends BasicDao<User, Long>{
    User findOneByUsername(String username);
}
