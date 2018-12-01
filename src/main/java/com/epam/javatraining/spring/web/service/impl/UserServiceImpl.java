package com.epam.javatraining.spring.web.service.impl;

import com.epam.javatraining.spring.web.controller.dto.UserDto;
import com.epam.javatraining.spring.web.dao.UserDao;
import com.epam.javatraining.spring.web.domain.User;
import com.epam.javatraining.spring.web.exception.UsernameExistsException;
import com.epam.javatraining.spring.web.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private UserDao userDao;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public User findOneByUsername(String username) {
        return userDao.findOneByUsername(username);
    }

    @Override
    public Long insert(User user) {
        return userDao.insert(user);
    }

    @Override
    public int update(User user) {
        return userDao.update(user);
    }

    @Override
    public Long save(User user) {
        return userDao.save(user);
    }

    @Override
    public void delete(User user) {
        userDao.delete(user);
    }

    @Override
    public void deleteById(Long id) {
        userDao.deleteById(id);
    }

    @Override
    public User findOne(User user) {
        return userDao.findOne(user);
    }

    @Override
    public User findOneById(Long id) {
        return userDao.findOneById(id);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public List<User> findAll(long offset, long count) {
        return userDao.findAll(offset, count);
    }

    @Override
    public Long count() {
        return userDao.count();
    }

    @Override
    public User registerNewUserAccount(UserDto userDto) throws UsernameExistsException {

        User user = new User();
        user.setFirstName(userDto.getFirstName());
        user.setLastName(userDto.getLastName());
        user.setUsername(userDto.getUsername());
        user.setEmail(userDto.getEmail());
        user.setRole(userDto.getRole());
        user.setVerified(userDto.getRole() != "ROLE_ADMIN");
        user.setActivated(false);

        String pass = passwordEncoder.encode(userDto.getPassword());
        user.setPassword(pass);

        try {
            userDao.insert(user);
        } catch(DuplicateKeyException e) {

            throw new UsernameExistsException(userDto.getUsername());
        }

        return user;
    }

    private boolean usernameExists(String username) {

        return (userDao.findOneByUsername(username) != null);
    }
}
