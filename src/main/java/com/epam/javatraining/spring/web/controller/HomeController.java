package com.epam.javatraining.spring.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.sql.DataSource;

import java.util.HashMap;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping( {"/"} )
public class HomeController {

    @Autowired
    private NamedParameterJdbcTemplate template;

    @RequestMapping(method=GET)
    public String home(Model model) {
        //template.update("insert into users (first_name) values('Web')");

        String sql = "insert into users (first_name) values(:firstName)";
        Map<String, Object> map = new HashMap<>();
        map.put("firstName", "Bob Web");
        template.update(sql, map);

        return "home";
    }
}
