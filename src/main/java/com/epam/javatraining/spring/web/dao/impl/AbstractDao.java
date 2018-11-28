package com.epam.javatraining.spring.web.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

public abstract class AbstractDao {
    @Autowired
    private NamedParameterJdbcTemplate template;

    public NamedParameterJdbcTemplate getTemplate() {
        return template;
    }
}
